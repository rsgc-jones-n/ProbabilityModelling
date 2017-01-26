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


// Display the welcome message
print("Welcome to Command Line Blackjack!\n")

func play(){
Game.startGame()
Game.playerTotal()
Game.statePlayerTotal()
Game.stateDealersFace()
Response.question()
Game.checkWinner()
//Deck.resetDeck()
Response.playAgain()
}
play()
