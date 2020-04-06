//
//  Card.swift
//  CardRank
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import Foundation

enum Suit : Int {
    case heart = 0
    case spade = 1
    case diamond = 2
    case club = 3
}

enum Value : Int {
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack = 11
    case queen = 12
    case king = 13
    case ace = 14
}

struct Card {
    let value : Value
    let suit : Suit
    
    init(value: Value, suit: Suit) {
        self.value = value
        self.suit = suit
    }
    
    init?(abv: String) {
        let last = String(abv.last!)
        switch last {
        case "H", "h": self.suit = .heart
        case "S", "s": self.suit = .spade
        case "D", "d": self.suit = .diamond
        case "C", "c": self.suit = .club
        default:       return nil
        }
        
        let stringValue = String(abv.dropLast())
        
        switch stringValue {
        case "A", "a", "14": self.value = .ace
        case "K", "k", "13": self.value = .king
        case "Q", "q", "12": self.value = .queen
        case "J", "j", "11": self.value = .jack
        case "10":           self.value = .ten
        case "9":            self.value = .nine
        case "8":            self.value = .eight
        case "7":            self.value = .seven
        case "6":            self.value = .six
        case "5":            self.value = .five
        case "4":            self.value = .four
        case "3":            self.value = .three
        case "2":            self.value = .two
        default:             return nil
        }
    }
}

extension Card : Comparable, Equatable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.value.rawValue < rhs.value.rawValue
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.value.rawValue == rhs.value.rawValue && lhs.suit.rawValue == rhs.suit.rawValue
    }
}
