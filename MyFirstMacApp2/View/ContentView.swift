//
//  ContentView.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/11/15.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pasteboardObservableObject: PasteboardObservableObject

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(pasteboardObservableObject.observableItems) { item in
                    Tile(text: item.contents, color: .blue)
                }
            }
        }.padding(10)
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
            .onTapGesture {
                print(text)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pasteboardObservableObject: PasteboardObservableObject.shared)
    }
}
