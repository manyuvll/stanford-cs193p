//Created by Emanuele Vella on 05/03/2021
//ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    var theme = themes.randomElement()!
    //private(set) can be seen outside of this vuemodel but not modified
    @Published private var game: MemoryGame<String>
    
    init() {
        game = EmojiMemoryGame.createMemoryGame(theme: theme)
    }

    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emoji: [String] = theme.cards
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsToShow ?? Int.random(in: 4...emoji.count)) { pairIndex in emoji[pairIndex] }
    }
    
    func newGame() {
        theme = themes.randomElement()!
        game = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Access to the score
    var score: Int {
        game.score
    }
    
    // MARK: - Access to theme color
    var themeColor: Color {
        theme.themeColor
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
