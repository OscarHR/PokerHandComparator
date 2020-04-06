//
//  Comparator.swift
//  CardRank
//
//  Created by Oscar Hernandez on 06/04/20.
//  Copyright © 2020 Oscar Hernandez. All rights reserved.
//

import Foundation

class HandComparator {
    static func compare(hand: Hand, to toHand: Hand) -> Hand {
        let handHandName = hand.getHandName()
        let toHandHandName = toHand.getHandName()

        if handHandName.rawValue > toHandHandName.rawValue {
            return hand
        } else if handHandName.rawValue < toHandHandName.rawValue {
            return toHand
        } else {
            // Todo: compare card by card
            return hand
        }
    }
}
