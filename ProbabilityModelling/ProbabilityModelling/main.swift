//
//  main.swift
//  ProbabilityModelling
//
//  Created by Nicholas Jones on 2017-01-16.
//  Copyright © 2017 Nicholas Jones. All rights reserved.
//

import Foundation
import Cocoa

// Creating suits for the deck of cards
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

/*
// Iterate over the deck of cards
for card in deck {
    print("Suit is \(Suit.glyph(forHashValue: card.suit)) and value is \(card.value)")
}
*/

print("Welcome to Command Line Blackjack!")
print("")

var playerHand : [Card] = []
var computerHand : [Card] = []

// "Shuffle" the deck and give half the cards to the player
while deck.count > 50 {
    
    // Generate a random number between 0 and the count of cards still left in the deck
    var position = Int(arc4random_uniform(UInt32(deck.count)))
    
    // Copy the card in this position to the player's hand
    playerHand.append(deck[position])
    
    // Remove the card from the deck for this position
    deck.remove(at: position)
    
    //print("There are \(deck.count) cards left in the deck")
    
}

// Print the face up cards to the user
print("Your Cards Are\(Suit.glyph(forHashValue: playerHand[0].suit))\(playerHand[0].value) and \(Suit.glyph(forHashValue: playerHand[1].suit))\(playerHand[1].value)")

print("Your cards total to \(playerHand[0].value + playerHand[1].value)")

if
    
    
    
    
    print("")
print("")


