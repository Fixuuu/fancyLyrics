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
    
    required init() {
        self.view = PKButton(title: "fancyLyrics", target: self)
    }
    
    @objc private func printMessage() {
        let notification = NSUserNotification()
        notification.title = "fancyLyrics"
        notification.informativeText = "Widget copied to Pock!"
        NSUserNotificationCenter.default.deliver(notification)
    }
    
}
