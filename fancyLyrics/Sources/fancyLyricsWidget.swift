//
//  fancyLyricsWidget.swift
//  fancyLyrics
//
//  Created by Oliwier Bażant on 10.07.2025.
//
//

import Foundation
import AppKit
import PockKit

class fancyLyricsWidget: PKWidget {

    static let identifier: String = "fixu.fancyLyrics"
    var customizationLabel: String = "fancyLyrics"
    var view: NSView!

    private let label = NSTextField(labelWithString: "…")
    private var timer: Timer?

    required init() {
        label.font = NSFont.systemFont(ofSize: 13)
        label.alignment = .center
        label.lineBreakMode = .byWordWrapping
        self.view = label

        updateLyrics()
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            self?.updateLyrics()
        }
    }

    private func updateLyrics() {
        guard let url = URL(string: "http://localhost:9863/2") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard
                let data = data,
                let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let text = obj["text"] as? String
            else { return }
            DispatchQueue.main.async {
                self?.label.stringValue = text
            }
        }
        task.resume()
    }

}
