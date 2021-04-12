//
//  MemoryGame.swift
//  Memorize
//
//  Created by Emanuele Vella on 05/03/2021.
//  Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var score: Int = 0
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                if cards[index].isFaceUp {
                    cards[index].isSeen = true
                }
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isMatched, !cards[chosenIndex].isFaceUp {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                cards[chosenIndex].isFaceUp = true
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                else {
                    score -= cards.indices.filter { cards[$0].isFaceUp && cards[$0].isSeen }.count
                }
            }
            else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in (0..<numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id:pairIndex*2, content: content))
            cards.append(Card(id:pairIndex*2+1, content: content))
        }
        
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isSeen: Bool = false
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
