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
    case fourOfAKind
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
        var tripleFound = 0
        var quadrupleFound = 0
        
        for (key, value) in dict {
            if value == 2 {
                pairs.append(key)
            } else if value == 3 {
                tripleFound = key
            } else if value == 4 {
                quadrupleFound = key
            }
        }

        if quadrupleFound != 0 {
            return .fourOfAKind
        }
        
        if tripleFound != 0 && pairs.count == 1 {
            return .fullHouse
        }
            
        if checkForFlush() {
            return .flush
        }
        
        if checkForStraight() {
            return .straight
        }
        
        if tripleFound != 0 {
            return .threeOfAKind
        }
        
        if pairs.count == 2 {
            return .twoPair
        }
        
        if pairs.count == 1 {
            return .pair
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
    
    func checkForFlush() -> Bool {
        var currentSuit : Suit? = nil
        
        for card in cards {
            if let currentSuit = currentSuit {
                if currentSuit != card.suit {
                    return false
                }
            } else {
                currentSuit = card.suit
            }
        }
        
        return true
    }
}

extension Hand : Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.cards == rhs.cards
    }
}
