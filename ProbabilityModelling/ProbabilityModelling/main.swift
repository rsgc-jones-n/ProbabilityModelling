//
//  main.swift
//  ProbabilityModelling
//
//  Created by Nicholas Jones on 2017-01-16.
//  Copyright © 2017 Nicholas Jones. All rights reserved.
//

import Foundation
import Cocoa

var playerHandCount = 0
var dealerHandCount = 0

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

// Display the welcome message
print("Welcome to Command Line Blackjack!\n")

// Declare the two hands
var playerHand : [Card] = []
var dealerHand : [Card] = []

// "Shuffle" the deck and give two cards to the player, two cards to the dealer
while deck.count > 50 {
    
    // Generate a random number between 0 and the count of cards still left in the deck
    var position = Int(arc4random_uniform(UInt32(deck.count)))
    
    // Copy the card in this position to the player's hand
    playerHand.append(deck[position])
    
    // Remove the card from the deck for this position
    deck.remove(at: position)
    
    //print("There are \(deck.count) cards left in the deck")
}

while deck.count > 48 && deck.count < 51 {
    
    // Generate a random number between 0 and the count of cards still left in the deck
    var position = Int(arc4random_uniform(UInt32(deck.count)))
    
    // Copy the card in this position to the player's hand
    dealerHand.append(deck[position])
    
    // Remove the card from the deck for this position
    deck.remove(at: position)
    
    //print("There are \(deck.count) cards left in the deck")
}

// Print the player their cards
print("Your cards are \(Suit.glyph(forHashValue: playerHand[0].suit))\(playerHand[0].value) and \(Suit.glyph(forHashValue: playerHand[1].suit))\(playerHand[1].value)")

// Toal the players cards by itterating over them

func playerTotal(){
for (index, card) in playerHand.enumerated() {
    
// If the card is a J, Q or K  only add 10 to count
    if card.value > 10 {
    
        playerHandCount += 10
        
    } else {
        playerHandCount += card.value
    }
}
}

print("Your cards total to \(playerHandCount)\n")
print("The dealers showing card is \(Suit.glyph(forHashValue: dealerHand[0].suit))\(dealerHand[0].value)")



// Total the dealers cards by itterating over them
for (index, card) in dealerHand.enumerated() {
    
    // If the card is a J, Q or K  only add 10 to count
    if card.value > 10 {
        
        dealerHandCount += 10
        
    } else {
        dealerHandCount += card.value
    }
}

// When the player or dealer has more than 21 cards
//func 21andOver() {

//}

func gun21() {
    
    print("Blackjack to the dealer!")
    
}

// Add a card to the players hand
func hit(){
    
    //print("Player Hit")
    
    var position = Int(arc4random_uniform(UInt32(deck.count)))
    
    // Copy the card in this position to the player's hand
    playerHand.append(deck[position])
    
    // Remove the card from the deck for this position
    deck.remove(at: position)
    
    //print("\nThere are \(deck.count) cards left in the deck")
    
    print("\nYou recieved a \(Suit.glyph(forHashValue: playerHand[playerHand.count - 1].suit))\(playerHand[playerHand.count - 1].value)\n")
    
    playerTotal()
}

func stand(){
    
    //print("Player Stands")
    
}


if dealerHandCount == 21 {
    gun21()
}

// Ask the player if they would like to hit, stand, double or split

var response : Bool = false
var responseString = "X"

func question() {

// Repeat until a proper response is given
repeat {
    
    print("\nWould you like to hit or stand?\n")
    
    if let input = readLine(strippingNewline: true) {
        responseString = input
        
        // If the player hits
        if responseString == "hit" || responseString == "Hit" {
            
            hit()
            
            //print("Player Hit")
            response = true
            
        // Id the player stands
        } else if responseString == "stand" || responseString == "Stand" {
            
            stand()
            
            //print("Plater Stands")
            response = false
            
        } else {
            responseString = "X"
        }
    }
} while responseString == "X"

}

question()


//print(dealerHandCount)


print("")
print("")


