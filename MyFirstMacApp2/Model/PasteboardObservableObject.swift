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
        if let cachedItems: [PasteboardItem] = UserDefaultsManager.value(forKey: .pasteboardItems) {
            observableItems = cachedItems
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onPasteboardChanged),
                                               name: .NSPasteboardDidChange,
                                               object: nil)
        PasteboardObserver.shared.start()
    }


    @objc private func onPasteboardChanged(_ notification: Notification) {
        guard let pb = notification.object as? NSPasteboard else { return }
        guard let items = pb.pasteboardItems else { return }
      
        // you should handle multiple types
        guard let item = items.first?.string(forType: .string) else { return }

        observableItems.insert(PasteboardItem(contents: item), at: 0)
        UserDefaultsManager.set(pasteboardItems: observableItems)
    }
}

struct PasteboardItem: Identifiable, Codable {
    let id: UUID
    let contents: String
    
    init(id: UUID = UUID(), contents: String) {
        self.id = id
        self.contents = contents
    }
}
