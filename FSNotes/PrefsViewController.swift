//
//  PrefsViewController.swift
//  FSNotes
//
//  Created by Oleksandr Glushchenko on 8/4/17.
//  Copyright © 2017 Oleksandr Glushchenko. All rights reserved.
//

import Cocoa
import MASShortcut
import CoreData
import FSNotesCore_macOS

class PrefsViewController: NSTabViewController  {

    override func viewDidLoad() {
        self.title = "Settings"
        super.viewDidLoad()
    }

    override func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let toolbarItem = super.toolbar(toolbar, itemForItemIdentifier: itemIdentifier, willBeInsertedIntoToolbar: flag)

        if
            let toolbarItem = toolbarItem,
            let tabViewItem = tabViewItems.first(where: { ($0.identifier as? String) == itemIdentifier.rawValue })
        {
            if let name = tabViewItem.identifier as? String, name == "git" {
                toolbarItem.label = "\(tabViewItem.label)          "
                return toolbarItem
            }

            if let name = tabViewItem.identifier as? String, !["advanced", "security"].contains(name)  {
                toolbarItem.label = "\(tabViewItem.label)    "
            }
        }
        
        return toolbarItem
    }
}
