//
//  ContentView.swift
//  memorize
//
//  Created by Yashasvi Pamu on 9/8/24.
//

import SwiftUI

struct ContentView: View {
    var CardDetails: [(isFaceUp:Bool,emoji:String)] = [(true,"🎃"),(false,"👻"),(true,"👻"),(false,"🎃")]
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
    @State var isFaceUp: Bool = false
    var emoji: String = "🎃"
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            if(isFaceUp) {
                
                base.foregroundColor(.white)
                base.stroke()
                Text(emoji).font(.largeTitle)
                
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
