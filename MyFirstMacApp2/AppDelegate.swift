//
//  AppDelegate.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/12/03.
//

import Cocoa
import HotKey

class AppDelegate: NSObject, NSApplicationDelegate {
    private let hotKey: HotKey = {
        let hotKey = HotKey(key: .r, modifiers: [.option, .command, .control])
        hotKey.keyDownHandler = {
            NSApplication.shared.activate(ignoringOtherApps: true)
        }
        return hotKey
    }()

    private var statusBarItem: NSStatusItem?
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupStatusBar()
    }

    private func setupStatusBar() {
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusBarItem?.button?.title = "📋"

        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit",
                                action: #selector(NSApplication.terminate(_:)),
                                keyEquivalent: "q"))
        statusBarItem?.menu = menu
    }
}
