//
//  PasteboardObserver.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/11/28.
//

import Cocoa

extension NSNotification.Name {
    public static let NSPasteboardDidChange: NSNotification.Name = .init(rawValue: "pasteboardDidChangeNotification")
}

/// https://medium.com/@fede.vitale/watch-for-nspasteboard-fad29d2f874e
extension PasteboardObservableObject {
    final class PasteboardObserver {
        static let shared = PasteboardObserver()
        private init() {}

        let pasteboard: NSPasteboard = .general

        var timer: Timer!
        var lastChangeCount: Int = 0

        func start() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: timerHandler)
        }

        private func timerHandler(timer: Timer) {
            guard self.lastChangeCount != self.pasteboard.changeCount else {
                return
            }
            self.lastChangeCount = self.pasteboard.changeCount
            NotificationCenter.default.post(name: .NSPasteboardDidChange, object: self.pasteboard)
        }
    }
}
