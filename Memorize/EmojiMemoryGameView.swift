//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Emanuele Vella on 05/03/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiMemoryGame: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Button("New Game") {
                emojiMemoryGame.newGame()
            }.frame(minWidth: 100, maxWidth: .infinity, minHeight: 44).foregroundColor(emojiMemoryGame.themeColor)
            Text(emojiMemoryGame.theme.name).font(.largeTitle).fontWeight(.thin)
            Text("Score: \(emojiMemoryGame.score)").font(.headline).fontWeight(.thin)
            Grid(emojiMemoryGame.cards) { card in
                CardView(card: card).onTapGesture {
                    emojiMemoryGame.choose(card: card)
                }
                .padding(5)
                .foregroundColor(emojiMemoryGame.themeColor)
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader() { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: edgeCornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: edgeCornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: edgeCornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
}

// MARK: - Drawing Constants

let edgeCornerRadius: CGFloat = 10.0
let edgeLineWidth: CGFloat = 3
let cardAspectRatio: CGFloat = 2/3
func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiMemoryGame: EmojiMemoryGame())
    }
}
