//
//  ContentView.swift
//  memorize
//
//  Created by Wojuade Abdul Afeez on 28/09/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🤖", "🎃", "🕷️", "🐱", "❌", "😈", "👺", "🐜", "🇳🇬", "🫎", "🧙🏻‍♀️", "👽", "👾", "🧙"]
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardAdjuster
        }.padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0 ..< cardCount, id: \.self) { index in
                cardView(content: emojis[index], isFaceUp: true)
          
            }.aspectRatio(2 / 3, contentMode: .fit)
        }.foregroundColor(.orange)
    }

    var cardAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
           
        }.imageScale(.large).font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }) {
            Image(systemName: symbol)
        }.disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
}

struct cardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = .init(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
           
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
