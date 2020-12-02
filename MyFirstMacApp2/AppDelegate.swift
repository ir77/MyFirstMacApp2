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
                          height: 150.0)
        window = NSWindow(
            contentRect: rect,
            styleMask: [],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.setFrameAutosaveName("Main Window")
        window.setFrameTopLeftPoint(NSPoint(x: 0.0, y: 150.0))
        window.level = .floating
        window.titleVisibility = .hidden

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView(pasteboardObservableObject: PasteboardObservableObject.shared)
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }
}
