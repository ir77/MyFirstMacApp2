//
//  AppDelegate.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/11/15.
//

import Cocoa
import SwiftUI
import HotKey

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    private var window: NSWindow!
    private var hotKey: HotKey = {
        let hotKey = HotKey(key: .r, modifiers: [.option, .command, .control])
        hotKey.keyDownHandler = {
            NSApplication.shared.activate(ignoringOtherApps: true)
        }
        return hotKey
    }()

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Create the window and set the content view.
        let frameSize = NSScreen.screens[0].visibleFrame.size
        let rect = NSRect(x: 0,
                          y: 0,
                          width: frameSize.width,
                          height: 500)
        window = NSWindow(
            contentRect: rect,
            styleMask: [.titled, .closable],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.setFrameAutosaveName("Main Window")
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

