//Created by Emanuele Vella on 05/03/2021
//ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    //private(set) can be seen outside of this vuemodel but not modified
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🐢", "🐙", "🐳", "🐟", "🦐", "🦀", "🐡", "🐬", "🐠", "🐋", "🦈"].shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in emojis[pairIndex] }
    }
    
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
