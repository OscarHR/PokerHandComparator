//
//  TestConstants.swift
//  CardRankTests
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import Foundation
@testable import CardRank

struct TestConstants {
    static let defaultHighCardHand = Hand(cards: [
        Card(value: .eight, suit: .heart),
        Card(value: .ace, suit: .club),
        Card(value: .ten, suit: .diamond),
        Card(value: .two, suit: .club),
        Card(value: .five, suit: .spade)
    ])
    
    static let defaultPairHand = Hand(cards: [
        Card(value: .five, suit: .heart),
        Card(value: .ace, suit: .club),
        Card(value: .ten, suit: .diamond),
        Card(value: .two, suit: .club),
        Card(value: .five, suit: .spade)
    ])
    
    
    static let defaultTwoPairHand = Hand(cards: [
        Card(value: .ace, suit: .heart),
        Card(value: .ten, suit: .diamond),
        Card(value: .ace, suit: .club),
        Card(value: .ten, suit: .club),
        Card(value: .five, suit: .spade)
    ])
    
    
    static let defaultThreeOfAKindHand = Hand(cards: [
        Card(value: .ace, suit: .heart),
        Card(value: .ace, suit: .diamond),
        Card(value: .ace, suit: .club),
        Card(value: .ten, suit: .club),
        Card(value: .five, suit: .spade)
    ])
    
    static let defaultStraightHand = Hand(cards: [
        Card(value: .ace, suit: .heart),
        Card(value: .two, suit: .diamond),
        Card(value: .three, suit: .club),
        Card(value: .four, suit: .club),
        Card(value: .five, suit: .spade)
    ])
    
    static let defaultFlushHand = Hand(cards: [
        Card(value: .ace, suit: .heart),
        Card(value: .two, suit: .heart),
        Card(value: .nine, suit: .heart),
        Card(value: .four, suit: .heart),
        Card(value: .ten, suit: .heart)
    ])
    
    static let defaultFullHouseHand = Hand(cards: [
        Card(value: .ace, suit: .heart),
        Card(value: .two, suit: .spade),
        Card(value: .ace, suit: .diamond),
        Card(value: .ace, suit: .club),
        Card(value: .two, suit: .heart)
    ])
    
    static let defaultFourOfAKindHand = Hand(cards: [
        Card(value: .ace, suit: .heart),
        Card(value: .ace, suit: .spade),
        Card(value: .ace, suit: .diamond),
        Card(value: .ace, suit: .club),
        Card(value: .two, suit: .heart)
    ])
    
    static let defaultStraightFlushHand = Hand(cards: [
        Card(value: .ace, suit: .heart),
        Card(value: .two, suit: .heart),
        Card(value: .three, suit: .heart),
        Card(value: .four, suit: .heart),
        Card(value: .five, suit: .heart)
    ])
    
    static let defaultRoyalFlushHand = Hand(cards: [
        Card(value: .ace, suit: .heart),
        Card(value: .queen, suit: .heart),
        Card(value: .king, suit: .heart),
        Card(value: .jack, suit: .heart),
        Card(value: .ten, suit: .heart)
    ])
}
