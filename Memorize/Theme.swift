//Created by Emanuele Vella on 11/04/2021

import Foundation
import SwiftUI


struct Theme: Identifiable {
    var id = UUID()
    var name: String
    var cards: [String]
    var numberOfPairsToShow: Int?
    var themeColor: Color
}


let themes: [Theme] = [
    Theme(name: "Halloween", cards: ["🧟‍♂️", "🧟‍♀️", "🧛‍♂️", "🎃", "👻", "🕸"], numberOfPairsToShow: nil, themeColor: Color.green),
    Theme(name: "Faces", cards: ["😀", "😂", "😌", "😡", "😝", "😊"], numberOfPairsToShow: 6, themeColor: Color.yellow),
    Theme(name: "Jobs", cards: ["👮🏻‍♀️", "🕵🏻", "🧑🏻‍🌾", "👨🏻‍💻"], numberOfPairsToShow: 4, themeColor: Color.blue),
    Theme(name: "Animals", cards: ["🦊", "🐯", "🦁", "🐼"], numberOfPairsToShow: 4, themeColor: Color.orange),
    Theme(name: "Sweets", cards: ["🍰", "🎂", "🍫", "🍩"], numberOfPairsToShow: 4, themeColor: Color.purple),
    Theme(name: "Balls", cards: ["⚽️", "🏀", "🎾", "🏐"], numberOfPairsToShow: 4, themeColor: Color.black),

]
