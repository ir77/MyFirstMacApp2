//
//  KeyboardManager.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/12/13.
//

import Foundation

struct KeyboardManager {
    static func vKeyDownAndUpWithCommand() {
        let kVK_ANSI_V: UInt16 = 0x09
        keyDown(key: kVK_ANSI_V, with: .maskCommand)
        keyUp(key: kVK_ANSI_V, with: .maskCommand)
    }
}

/// https://qiita.com/Kyome/items/33143418d061fd7ec7d6
private extension KeyboardManager {
    private static func keyDown(key: CGKeyCode, with: CGEventFlags) {
        let source = CGEventSource(stateID: .hidSystemState)
        let event = CGEvent(keyboardEventSource: source, virtualKey: key, keyDown: true)
        event?.flags = with
        event?.post(tap: .cghidEventTap)
    }

    private static func keyUp(key: CGKeyCode, with: CGEventFlags) {
        let source = CGEventSource(stateID: .hidSystemState)
        let event = CGEvent(keyboardEventSource: source, virtualKey: key, keyDown: false)
        event?.flags = with
        event?.post(tap: .cghidEventTap)
    }
}
