//
//  CardRankTests.swift
//  CardRankTests
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import XCTest
@testable import CardRank

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
    
}

// MARK: - Hand Name Tests
extension CardRankTests {
    func testHandNamePair() {
        let h1 = Hand(cards: [
            Card(value: .ace, suit: .heart),
            Card(value: .ace, suit: .club),
            Card(value: .ten, suit: .diamond),
            Card(value: .two, suit: .club),
            Card(value: .five, suit: .spade)
        ])
        
        let h2 = Hand(cards: [
            Card(value: .five, suit: .heart),
            Card(value: .ace, suit: .club),
            Card(value: .ten, suit: .diamond),
            Card(value: .two, suit: .club),
            Card(value: .five, suit: .spade)
        ])
        
        let h3 = Hand(cards: [
            Card(value: .five, suit: .heart),
            Card(value: .ace, suit: .club),
            Card(value: .ten, suit: .diamond),
            Card(value: .two, suit: .club),
            Card(value: .ten, suit: .spade)
        ])
        
        let h4 = Hand(cards: [
            Card(value: .five, suit: .heart),
            Card(value: .ace, suit: .club),
            Card(value: .ten, suit: .diamond),
            Card(value: .two, suit: .club),
            Card(value: .two, suit: .spade)
        ])
        
        XCTAssertEqual(h1.getHandName(), HandName.pair)
        XCTAssertEqual(h2.getHandName(), HandName.pair)
        XCTAssertEqual(h3.getHandName(), HandName.pair)
        XCTAssertEqual(h4.getHandName(), HandName.pair)
    }
    
    func testHandNameTwoPair() {
        let h1 = Hand(cards: [
            Card(value: .ace, suit: .heart),
            Card(value: .ten, suit: .diamond),
            Card(value: .ace, suit: .club),
            Card(value: .ten, suit: .club),
            Card(value: .five, suit: .spade)
        ])
        
        let h2 = Hand(cards: [
            Card(value: .eight, suit: .heart),
            Card(value: .nine, suit: .diamond),
            Card(value: .nine, suit: .club),
            Card(value: .two, suit: .spade),
            Card(value: .eight, suit: .club)
        ])
        
        let h3 = Hand(cards: [
            Card(value: .two, suit: .spade),
            Card(value: .six, suit: .heart),
            Card(value: .six, suit: .club),
            Card(value: .two, suit: .diamond),
            Card(value: .nine, suit: .club)
        ])
        
        let h4 = Hand(cards: [
            Card(value: .king, suit: .spade),
            Card(value: .ace, suit: .heart),
            Card(value: .king, suit: .club),
            Card(value: .two, suit: .diamond),
            Card(value: .ace, suit: .club)
        ])
        
        XCTAssertEqual(h1.getHandName(), HandName.twoPair)
        XCTAssertEqual(h2.getHandName(), HandName.twoPair)
        XCTAssertEqual(h3.getHandName(), HandName.twoPair)
        XCTAssertEqual(h4.getHandName(), HandName.twoPair)
    }
    
    func testHandNameThreeOfAKind() {
        let h1 = Hand(cards: [
            Card(value: .ace, suit: .heart),
            Card(value: .ace, suit: .diamond),
            Card(value: .ace, suit: .club),
            Card(value: .ten, suit: .club),
            Card(value: .five, suit: .spade)
        ])
        
        let h2 = Hand(cards: [
            Card(value: .ten, suit: .heart),
            Card(value: .seven, suit: .diamond),
            Card(value: .four, suit: .club),
            Card(value: .ten, suit: .club),
            Card(value: .ten, suit: .spade)
        ])
        
        let h3 = Hand(cards: [
            Card(value: .six, suit: .heart),
            Card(value: .seven, suit: .diamond),
            Card(value: .four, suit: .club),
            Card(value: .seven, suit: .club),
            Card(value: .seven, suit: .spade)
        ])
        
        let h4 = Hand(cards: [
            Card(value: .queen, suit: .heart),
            Card(value: .seven, suit: .diamond),
            Card(value: .queen, suit: .club),
            Card(value: .ten, suit: .club),
            Card(value: .queen, suit: .spade)
        ])
        
        XCTAssertEqual(h1.getHandName(), HandName.threeOfAKind)
        XCTAssertEqual(h2.getHandName(), HandName.threeOfAKind)
        XCTAssertEqual(h3.getHandName(), HandName.threeOfAKind)
        XCTAssertEqual(h4.getHandName(), HandName.threeOfAKind)
    }
    
    func testHandNameStraight() {
        let h1 = Hand(cards: [
            Card(value: .ace, suit: .heart),
            Card(value: .two, suit: .diamond),
            Card(value: .three, suit: .club),
            Card(value: .four, suit: .club),
            Card(value: .five, suit: .spade)
        ])
        
        let h2 = Hand(cards: [
            Card(value: .five, suit: .heart),
            Card(value: .four, suit: .diamond),
            Card(value: .three, suit: .club),
            Card(value: .two, suit: .club),
            Card(value: .ace, suit: .spade)
        ])
        
        let h3 = Hand(cards: [
            Card(value: .ace, suit: .heart),
            Card(value: .king, suit: .diamond),
            Card(value: .jack, suit: .club),
            Card(value: .queen, suit: .club),
            Card(value: .ten, suit: .spade)
        ])
        
        let h4 = Hand(cards: [
            Card(value: .seven, suit: .heart),
            Card(value: .six, suit: .diamond),
            Card(value: .eight, suit: .club),
            Card(value: .five, suit: .club),
            Card(value: .nine, suit: .spade)
        ])
        
        XCTAssertEqual(h1.getHandName(), HandName.straight)
        XCTAssertEqual(h2.getHandName(), HandName.straight)
        XCTAssertEqual(h3.getHandName(), HandName.straight)
        XCTAssertEqual(h4.getHandName(), HandName.straight)
    }
}

// MARK: - Hand comparisons
extension CardRankTests {
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
        
        XCTAssertEqual(firstHand, secondHand)
    }
}
