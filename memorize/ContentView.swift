//
//  ContentView.swift
//  memorize
//
//  Created by Yashasvi Pamu on 9/8/24.
//

import SwiftUI

struct ContentView: View {
    var CardDetails: [(isFaceUp:Bool,emoji:String)] = [(false,"🎃"),(false,"👻"),(false,"👻"),(false,"🎃")]
    var body: some View {
        HStack {
            ForEach(CardDetails.indices, id: \.self) {
                index in
                Cardview(isFaceUp: CardDetails[index].isFaceUp, emoji: CardDetails[index].emoji)
            }
        }.foregroundColor(.green)
        .padding()
    }
}

struct Cardview: View {
    var isFaceUp: Bool
    var emoji: String
    
    init(isFaceUp: Bool = false, emoji: String = "🎃") {
        self.isFaceUp = isFaceUp
        self.emoji = emoji
    }
    
    var body: some View {
        if(isFaceUp) {
            ZStack (content : {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).stroke()
                Text(emoji).font(.largeTitle)
            })
            
        } else {
            RoundedRectangle(cornerRadius: 12)
        }
    }
}

#Preview {
    ContentView()
}
