//
//  CardRankTests.swift
//  CardRankTests
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import XCTest
@testable import CardRank

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

struct Hand  {
    let cards : [Card]
    
    init(cards: [Card]) {
        self.cards = cards.sorted(by: { $0 > $1 })
    }
}

extension Hand : Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.cards == rhs.cards
    }
}

class Comparator {
    static func compare(hand: Hand, to toHand: Hand) -> Hand {
        return Hand(cards: [])
    }
}

class CardRankTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateCardAceOfHearts() {
        let card = Card(value: .ace, suit: .heart)
        
        XCTAssertEqual(card.value, Value.ace)
        XCTAssertEqual(card.suit, Suit.heart)
    }
    
    func testHandsAreEqual() {
        let firstHand = Hand(cards: [
            Card(value: .ace, suit: .heart),
            Card(value: .ace, suit: .club),
            Card(value: .ten, suit: .diamond),
            Card(value: .two, suit: .club),
            Card(value: .five, suit: .spade)
        ])
        
        let secondHand = Hand(cards: [
            Card(value: .ten, suit: .club),
            Card(value: .two, suit: .spade),
            Card(value: .ace, suit: .diamond),
            Card(value: .five, suit: .heart),
            Card(value: .ace, suit: .spade),
        ])
        
        print(firstHand.cards)
        print("..")
        print(secondHand.cards)
        
        XCTAssertEqual(firstHand, secondHand)
    }
}
