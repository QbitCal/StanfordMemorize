//
//  ContentView.swift
//  Memorize
//  This is my project based on Stanford's SwiftUI course on YouTube.
//
//  Created by Quenten Calvano on 11/12/21.
//
//  Version: 11/15/2021
//  Video: Lecture 2 -> 1:04:08
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🐨", "🙈", "🐸", "🦁", "🐯", "🦄", "🦋", "🐛", "🦑", "🦆" , "🐳", "🦧", "🐕", "🐿", "🐈", "🐖", "🦭", "🪰", "🐞", "🐝", "🦢", "🦝" , "🦨", "🦓"]
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            HStack {
                ForEach (emojis[0...emojiCount], id: \.self, content: { emoji in
                    CardView(content: emoji)
                })
            }
            .padding(.horizontal)
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
        }
    }
    //Create the remove button to remove cards...
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
                .font(.largeTitle)
                .foregroundColor(.red)
        }
    }
    //Create the add button to add more cards...
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                .font(.largeTitle)
                .foregroundColor(.red)
        }
    }
}

//Create the card view and handle the tap gestures...
struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
