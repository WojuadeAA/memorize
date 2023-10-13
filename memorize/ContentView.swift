//
//  ContentView.swift
//  memorize
//
//  Created by Wojuade Abdul Afeez on 28/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            cardView(isFaceUp: true)
            cardView()
            cardView()
            cardView()
        }.foregroundColor(.orange)
            .padding()
    }
}

struct cardView: View{
    var isFaceUp : Bool = false
    var body: some View{
        
        if isFaceUp{
            ZStack(content: {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            })
        }else
        {
            RoundedRectangle(cornerRadius: 12)
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
