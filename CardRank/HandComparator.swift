//
//  Comparator.swift
//  CardRank
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import Foundation

enum HandComparisonOutcome {
    case equal
    case better
    case worse
}

class HandComparator {
    static func compare(hand: Hand, to toHand: Hand) -> HandComparisonOutcome {
        let handName = hand.getHandName()
        let toHandName = toHand.getHandName()

        if handName.rawValue > toHandName.rawValue {
            return .better
        } else if handName.rawValue < toHandName.rawValue {
            return .worse
        } else {
            for i in 0..<hand.cards.count {
                let cardHand = hand.cards[i]
                let cardToHand = toHand.cards[i]
                
                if cardHand > cardToHand {
                    return .better
                } else if cardHand < cardToHand {
                    return .worse
                }
            }
            
            return .equal
        }
    }
}
