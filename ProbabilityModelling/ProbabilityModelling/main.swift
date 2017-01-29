//
//  main.swift
//  ProbabilityModelling
//
//  Created by Nicholas Jones on 2017-01-16.
//  Copyright © 2017 Nicholas Jones. All rights reserved.
//

import Foundation
import Cocoa

var Game: PlayGame = PlayGame()
var Response: UserResponse = UserResponse()
var Deck: cardDeck = cardDeck()
var deck : [Card] = []

// Display the welcome message
print("Welcome to Command Line Blackjack!\n")

func initializeDeck() {
    // Initalize a deck of cards
    for suit in 0...3 {
        for value in 2...14 {
            var card = Card(value: value, suit: suit)
            deck.append(card)
        }
    }
}

// List functions to play the game
func play(){
Game.startGame()
Game.playerTotal()
Game.statePlayerTotal()
Game.stateDealersFace()
Response.question()
Game.checkWinner()
Deck.removeCards()
Game.resetHands()
initializeDeck()
Response.playAgain()

}

// Create the deck
initializeDeck()

// Play the game
play()
