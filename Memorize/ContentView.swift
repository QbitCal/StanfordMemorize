//
//  ContentView.swift
//  Memorize
//  This is my project based on Stanford's SwiftUI course on YouTube.
//
//  Created by Quenten Calvano on 11/12/21.
//
//  Version: 11/15/2021
//
//  Video: Lecture 3 -> 18:54
//  Stanford's Spring 2021 CS193p course:
//  (Developing Applications for iOS)

//

import SwiftUI

struct ContentView: View {
    var emojis = ["🐨", "🙈", "🐸", "🦁", "🐯", "🦄", "🦋", "🐛", "🦑", "🦆" , "🐳", "🦧", "🐕", "🐿", "🐈", "🐖", "🦭", "🪰", "🐞", "🐝", "🦢", "🦝" , "🦨", "🦓"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach (emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .padding(.horizontal)
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
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
                shape.strokeBorder(lineWidth: 3)
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
.previewInterfaceOrientation(.portrait)
    }
}
