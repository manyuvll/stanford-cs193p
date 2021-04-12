//Created by Emanuele Vella on 12/04/2021

import Foundation

@propertyWrapper
struct ZeroOrMore {
    private var number: Int
    init() { self.number = 0 }
    var wrappedValue: Int {
        get { return number }
        set { number = max(0, newValue) }
    }
}
