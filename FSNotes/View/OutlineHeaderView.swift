//
//  OutlineHeaderView.swift
//  FSNotes
//
//  Created by Oleksandr Glushchenko on 7/21/18.
//  Copyright © 2018 Oleksandr Glushchenko. All rights reserved.
//

import Cocoa

class OutlineHeaderView: NSView {

    override func mouseDown(with event: NSEvent) {
        if event.clickCount == 2 {
            if let md = AppDelegate.mainWindowController, let actionOnDoubleClick = UserDefaults.standard.object(forKey: "AppleActionOnDoubleClick") as? String {

                switch actionOnDoubleClick {
                case "Maximize":
                    md.maximizeWindow()
                case "Minimize":
                    md.window?.performMiniaturize(nil)
                default:
                    break
                }
            }
        } else {
            super.mouseDown(with: event)
        }
    }

    override func draw(_ dirtyRect: NSRect) {
       super.draw(dirtyRect)


       let lightColor = NSColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
       let darkColor = NSColor(red:0.16, green:0.17, blue:0.18, alpha:1.0)

       if NSAppearance.current.isDark {
          darkColor.setFill()
       } else {
          lightColor.setFill()
       }

       dirtyRect.fill()
    }

    override var mouseDownCanMoveWindow: Bool {
        return true
    }
}
