//
//  Hand.swift
//  CardRank
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import Foundation

enum HandName : Int {
    case highCard = 1
    case pair = 2
    case twoPair = 3
    case threeOfAKind = 4
    case straight = 5
    case flush = 6
    case fullHouse = 7
    case fourOfAKind = 8
    case straightFlush = 9
    case royalFlush = 10
}

struct Hand  {
    let cards : [Card]
    
    init(cards: [Card]) {
        self.cards = cards.sorted(by: { $0 > $1 })
    }
    
    func beats(hand: Hand) -> Bool {
        return self == HandComparator.compare(hand: self, to: hand)
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
        
        if checkForRoyalFlush() {
            return .royalFlush
        }

        if checkForStraightFlush() {
            return .straightFlush
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
    
    private func checkForRoyalFlush() -> Bool {
        return checkForStraightFlush()
            && cards.contains(where: { (card) -> Bool in
                return card.value == .ace
            }) && cards.contains(where: { (card) -> Bool in
                return card.value == .king
            })
    }
    
    private func checkForStraightFlush() -> Bool {
        return checkForStraight() && checkForFlush() 
    }
    
    private func checkForFlush() -> Bool {
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
    
    private func checkForStraight() -> Bool {
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
