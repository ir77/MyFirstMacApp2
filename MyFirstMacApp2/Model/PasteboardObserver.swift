//
//  PasteboardObserver.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/11/28.
//

import Cocoa

/// https://medium.com/@fede.vitale/watch-for-nspasteboard-fad29d2f874e
final class PasteboardObserver {
    static let shared = PasteboardObserver()
    private init() {}
    
    var timer: Timer!
    let pasteboard: NSPasteboard = .general
    var lastChangeCount: Int = 0
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            guard self.lastChangeCount != self.pasteboard.changeCount else {
                return
            }
            
            self.lastChangeCount = self.pasteboard.changeCount
            NotificationCenter.default.post(name: .NSPasteboardDidChange, object: self.pasteboard)
        }
    }
    
    func stop() {
        timer.invalidate()
    }
}

extension NSNotification.Name {
    public static let NSPasteboardDidChange: NSNotification.Name = .init(rawValue: "pasteboardDidChangeNotification")
}
