//
//  UserDefaultsManager.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/12/03.
//

import Foundation

struct UserDefaultsManager {
    enum UserDefaultsKey: String {
        case pasteboardItems
    }

    private static func setValue(_ value: Any?, forKey key: UserDefaultsKey) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    static func value<T: Decodable>(forKey key: UserDefaultsKey) -> T? {
        if let data = UserDefaults.standard.value(forKey: key.rawValue) as? Data {
            return try? JSONDecoder().decode(T.self, from: data)
        }
        return nil
    }
    
    static func set(pasteboardItems: [PasteboardItem]) {
        let json = try? JSONEncoder().encode(pasteboardItems)
        setValue(json, forKey: .pasteboardItems)
    }
}



