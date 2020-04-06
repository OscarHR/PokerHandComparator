//
//  Comparator.swift
//  CardRank
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import Foundation

class HandComparator {
    static func compare(hand: Hand, to toHand: Hand) -> Hand {
        let handName = hand.getHandName()
        let toHandName = toHand.getHandName()

        if handName.rawValue > toHandName.rawValue {
            return hand
        } else if handName.rawValue < toHandName.rawValue {
            return toHand
        } else {
            for i in 0..<hand.cards.count {
                let cardHand = hand.cards[i]
                let cardToHand = toHand.cards[i]
                
                if cardHand > cardToHand {
                    return hand
                } else if cardHand < cardToHand {
                    return toHand
                }
            }
            
            return Hand(cards: [])
        }
    }
}
