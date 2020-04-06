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

enum Value {
    case ace
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
}

struct Card {
    let value : Value
    let suit : Suit
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
    
}
