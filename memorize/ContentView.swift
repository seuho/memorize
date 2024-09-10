//
//  ContentView.swift
//  memorize
//
//  Created by Yashasvi Pamu on 9/8/24.
//

import SwiftUI

struct ContentView: View {
    var CardDetails: [String] = ["🎃","👻","👻","🎃", "🤡","👾","🤡","👾"]
    @State var cardCount : Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) {
                index in
                Cardview(emoji: CardDetails[index]).aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.green)
    }
    
    var cardCountAdjuster : some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }.imageScale(.large).font(.largeTitle)
    }
    
    func cardAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > CardDetails.count)
    }
    
    var cardAdder : some View {
        cardAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cardRemover : some View {
        cardAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct Cardview: View {
    @State var isFaceUp: Bool = false
    let emoji: String
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.stroke()
                Text(emoji).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
