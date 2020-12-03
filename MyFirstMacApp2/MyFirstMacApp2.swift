//
//  MyFirstMacApp2.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/11/15.
//

import SwiftUI
import HotKey

// TODO
// - [x] listを表示したい
// - [x] scrollさせる
// - [x] ショートカットキーで画面を表示する
// - [x] 画面の下に表示する
// - [x] クリップボードのアイテムを取得する
// - [x] クリップボード監視する
// - [x] クリップボードの状態を画面に反映する
// - [x] クリップボードの変更をメモリに保存する
// - [x] クリップボードの変更をディスクに保存する
// - Architecture
// - [ ] パッケージ分割
// - View
// - [ ] デザインよくする
// - Model
// - [ ] アプリを永続化させる
// - [ ] エスケープや別画面を触るとhideさせる
// - [ ] String以外の複数のコピー型に対応する
// - [ ] テキストの重複は排除する
// - [ ] DB検討

@main
struct MyFirstMacApp2: App {
    private var hotKey: HotKey = {
        let hotKey = HotKey(key: .r, modifiers: [.option, .command, .control])
        hotKey.keyDownHandler = {
            NSApplication.shared.activate(ignoringOtherApps: true)
        }
        return hotKey
    }()

    private let frameSize = NSScreen.screens[0].visibleFrame.size

    var body: some Scene {
        WindowGroup {
            ContentView(pasteboardObservableObject: PasteboardObservableObject.shared)
                .frame(width: frameSize.width, height: 228.0, alignment: .bottom)
        }
    }
}
