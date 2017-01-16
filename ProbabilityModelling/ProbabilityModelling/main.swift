//
//  main.swift
//  ProbabilityModelling
//
//  Created by Nicholas Jones on 2017-01-16.
//  Copyright © 2017 Nicholas Jones. All rights reserved.
//

import Foundation
import Cocoa

// Create an enumeration for the suits of a deck of cards
enum Suit : String {
    
    case hearts     = "❤️"
    case diamonds   = "♦️"
    case spades     = "♠️"
    case clubs      = "♣️"
    
    // Given a value, returns the suit
    static func glyph(forHashValue : Int) -> String {
        switch forHashValue {
        case 0 :
            return Suit.hearts.rawValue
        case 1 :
            return Suit.diamonds.rawValue
        case 2 :
            return Suit.spades.rawValue
        case 3 :
            return Suit.clubs.rawValue
        default:
            return Suit.hearts.rawValue
        }
    }
    
}

// Play with the enumeration a bit to see what it gives us
Suit.hearts.hashValue
Suit.hearts.rawValue
Suit.diamonds.hashValue
Suit.diamonds.rawValue
Suit.spades.hashValue
Suit.spades.rawValue
Suit.clubs.hashValue
Suit.clubs.rawValue

// Create a new datatype to represent a playing card
struct Card {
    
    var value : Int
    var suit : Int
    
    // Initializer accepts arguments to set up this instance of the struct
    init(value : Int, suit : Int) {
        self.value = value
        self.suit = suit
    }
    
}

// Initalize a deck of cards
var deck : [Card] = []
for suit in 0...3 {
    for value in 2...14 {
        var card = Card(value: value, suit: suit)
        deck.append(card)
    }
}

// Iterate over the deck of cards
for card in deck {
    print("Suit is \(Suit.glyph(forHashValue: card.suit)) and value is \(card.value)")
}

var playerHand : [Card] = []
var computerHand : [Card] = []


