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
    
    static var identifier: String = "fixu.fancyLyrics"
    var customizationLabel: String = "fancyLyrics"
    var view: NSView!
    
    required init() {
        self.view = PKButton(title: "fancyLyrics", target: self, action: #selector(printMessage))
    }
    
    @objc private func printMessage() {
        NSLog("[fancyLyricsWidget]: Hello, World!")
    }
    
}
