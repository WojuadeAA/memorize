//
//  ContentView.swift
//  memorize
//
//  Created by Wojuade Abdul Afeez on 28/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            cardView(isFaceUp: true)
            cardView()
            cardView()
            cardView()
        }.foregroundColor(.orange)
            .padding()
    }
}

struct cardView: View {
   @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let base: RoundedRectangle = .init(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
            else {
               
                base.fill()
            }
            
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
