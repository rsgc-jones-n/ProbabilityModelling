//
//  deck.swift
//  ProbabilityModelling
//
//  Created by Nicholas Jones on 2017-01-26.
//  Copyright © 2017 Nicholas Jones. All rights reserved.
//

import Foundation

class cardDeck {
    

    // Declare the two hands - These are global variables
    var playerHand : [Card] = []
    var dealerHand : [Card] = []
    var deck : [Card] = []
    
    // Initalize a deck of cards
    for suit in 0...3 {
    for value in 2...14 {
    var card = Card(value: value, suit: suit)
    deck.append(card)
    }
    }

}
