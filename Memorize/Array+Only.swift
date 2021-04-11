//Created by Emanuele Vella on 10/04/2021

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
