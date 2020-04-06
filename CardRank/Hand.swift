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
        var triples = [Int]()
        
        for (key, value) in dict {
            if value == 2 {
                pairs.append(key)
            } else if value == 3 {
                triples.append(key)
            }
        }
        
        if pairs.count == 1 {
            return .pair
        } else if pairs.count == 2 {
            return .twoPair
        } else if triples.count == 1 {
            return .threeOfAKind
        }
        
        if checkForStraight() {
            return .straight
        }
        
        return .highCard
    }
    
    func checkForStraight() -> Bool {
        var previousCard : Card? = nil
        var straightCount = 0
        var firstCardIsAce = false
        
        for card in cards {
            if let previous = previousCard {
                let next = previous.value.rawValue - 1
                if firstCardIsAce {
                    if next != 13 && next != 5 {
                        break
                    } else {
                        firstCardIsAce = false
                    }
                } else if next != card.value.rawValue {
                    break
                }
            } else if card.value == .ace {
                firstCardIsAce = true
            }
            
            previousCard = card
            
            straightCount = straightCount + 1
        }
        
        return straightCount == 5
    }
}

extension Hand : Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.cards == rhs.cards
    }
}
