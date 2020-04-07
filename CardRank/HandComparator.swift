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
        } else if handName == .straight || handName == .straightFlush {
            let handFirstCard = hand.cards[0]
            let toHandFirstCard = toHand.cards[0]
            let handSecondCard = hand.cards[1]
            let toHandSecondCard = hand.cards[1]
            
            if handFirstCard.value == toHandFirstCard.value && handSecondCard.value == toHandSecondCard.value {
                return .equal
            } else if handFirstCard.value == .ace && handSecondCard.value == .five {
                if toHandFirstCard.value.rawValue >= Value.six.rawValue {
                    return .worse
                }
            } else if toHandFirstCard.value == .ace && toHandSecondCard.value == .five {
                if handFirstCard.value.rawValue >= Value.six.rawValue {
                    return .better
                }
            }
        }
        
        return compareByCard(hand: hand, to: toHand)
    }
    
    private static func compareByCard(hand: Hand, to toHand: Hand) -> HandComparisonOutcome {
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
