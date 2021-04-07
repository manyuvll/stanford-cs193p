//Created by Emanuele Vella on 12/03/2021

import Foundation

extension Array where Element : Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if(matching.id == self[index].id) {
                return index
            }
        }
        return 0 //TODO: bogus!
    }
}
