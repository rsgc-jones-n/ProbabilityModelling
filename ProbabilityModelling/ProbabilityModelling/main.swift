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

// Initalize a deck of cards
var deck : [Card] = []
for suit in 0...3 {
    for value in 2...14 {
        
        var card = Card(value: value, suit: suit)
        deck.append(card)
        
    }
}

// Declare the two hands - These are global variables
var playerHand : [Card] = []
var dealerHand : [Card] = []

func play(){
Game.playerTotal()
Game.statePlayerTotal()
Game.stateDealersFace()
Response.question()
Game.checkWinner()
}

Game.startGame()
play()
Response.playAgain()
