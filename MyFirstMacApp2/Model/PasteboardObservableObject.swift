//
//  PasteboardObservableObject.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/12/01.
//

import Cocoa

final class PasteboardObservableObject: ObservableObject {
    static let shared = PasteboardObservableObject()
    @Published var observableItems: [PasteboardItem] = []

    private init() {
        PasteboardObserver.shared.start()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onPasteboardChanged),
                                               name: .NSPasteboardDidChange,
                                               object: nil)

    }


    @objc private func onPasteboardChanged(_ notification: Notification) {
        guard let pb = notification.object as? NSPasteboard else { return }
        guard let items = pb.pasteboardItems else { return }
      
        // you should handle multiple types
        guard let item = items.first?.string(forType: .string) else { return }
        observableItems.insert(PasteboardItem(contents: item), at: 0)
    }
}

struct PasteboardItem: Identifiable {
    let id = UUID()
    let contents: String
}
