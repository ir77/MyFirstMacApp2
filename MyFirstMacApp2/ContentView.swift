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
// - [ ] 画面の下に表示する
// - [ ] ショートカットキーで呼ぶ
// - [ ] クリップボード監視する
struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(1..<100) { _ in
                    EmojiTile(text: "😀", color: .blue)
                    EmojiTile(text: "😉", color: .green)
                    EmojiTile(text: "😊", color: .purple)
                    EmojiTile(text: "😀", color: .blue)
                    EmojiTile(text: "😉", color: .green)
                    EmojiTile(text: "😊", color: .purple)
                    EmojiTile(text: "😀", color: .blue)
                    EmojiTile(text: "😉", color: .green)
                    EmojiTile(text: "😊", color: .purple)
                }
            }
        }
    }
}

struct EmojiTile: View {
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
        ContentView()
    }
}
