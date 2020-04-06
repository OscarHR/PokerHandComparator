//
//  Card.swift
//  CardRank
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import Foundation

enum Suit {
    case heart
    case spade
    case diamond
    case club
}

enum Value : Int {
    case ace = 1
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
}

struct Card {
    let value : Value
    let suit : Suit
}

extension Card : Comparable, Equatable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.value.rawValue < rhs.value.rawValue
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.value.rawValue == rhs.value.rawValue
    }
}
