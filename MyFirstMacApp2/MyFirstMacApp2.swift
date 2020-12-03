//
//  MyFirstMacApp2.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/11/15.
//

import SwiftUI

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
// - [x] タスクに出さないようにする&ステータスバーに文字を表示
// - Architecture
// - [ ] パッケージ分割
// - View
// - [ ] デザインよくする
// - Model
// - [WIP] アプリを永続化させる
// - [ ] エスケープや別画面を触るとhideさせる
// - [ ] String以外の複数のコピー型に対応する
// - [ ] テキストの重複は排除する
// - [ ] DB検討
// - [ ] ログイン時に起動する
//   - https://blog.piyo.tech/posts/2020-05-12-mac-app-memo/

@main
struct MyFirstMacApp2: App {
    // swiftlint:disable weak_delegate
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    private let frameSize = NSScreen.screens[0].visibleFrame.size
    var body: some Scene {
        WindowGroup {
            ContentView(pasteboardObservableObject: PasteboardObservableObject.shared)
                .frame(width: frameSize.width, height: 228.0, alignment: .bottom)
        }
    }
}
