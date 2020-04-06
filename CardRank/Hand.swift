//
//  Hand.swift
//  CardRank
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import Foundation

enum HandName {
    case highCard
    case pair
    case twoPair
    case threeOfAKind
    case straight
    case flush
    case fullHouse
    case FourOfAKind
    case straightFlush
    case royalFlush
}

struct Hand  {
    let cards : [Card]
    
    init(cards: [Card]) {
        self.cards = cards.sorted(by: { $0 > $1 })
    }
    
    func getHandName() -> HandName {
        
        var dict = [Int : Int]()
        
        // Find how many of each card we have
        for card in cards {
            let count = dict[card.value.rawValue] ?? 0
            dict[card.value.rawValue] = count + 1
        }
        
        var pairs = [Int]()
        
        for (key, value) in dict {
            if value == 2 {
                pairs.append(key)
            }
        }
        
        if pairs.count == 1 {
            return .pair
        } else if pairs.count == 2 {
            return .twoPair
        }
        
        return .highCard
    }
}

extension Hand : Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.cards == rhs.cards
    }
}
