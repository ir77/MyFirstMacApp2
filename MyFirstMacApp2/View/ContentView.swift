//
//  ContentView.swift
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
struct ContentView: View {
    @ObservedObject var pasteboardObservableObject: PasteboardObservableObject

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(pasteboardObservableObject.observableItems) { item in
                    Tile(text: item.contents, color: .blue)
                }
            }
        }
    }
}

struct Tile: View {
    var text: String
    var color: Color

    var body: some View {
        Text(text)
            .font(.custom("Emoji", size: 50))
            .padding(50)
            .background(color)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pasteboardObservableObject: PasteboardObservableObject.shared)
    }
}
