//
//  playGame.swift
//  ProbabilityModelling
//
//  Created by Nicholas Jones on 2017-01-26.
//  Copyright © 2017 Nicholas Jones. All rights reserved.
//

import Foundation
class PlayGame {
    
    var Deck: cardDeck = cardDeck()
    
    var playerHandCount = 0
    var dealerHandCount = 0
    
    init() {
        
    }
    
    func startGame() {
        
        // "Shuffle" the deck and give two cards to the player, two cards to the dealer
        while deck.count > 50 {
            
            // Generate a random number between 0 and the count of cards still left in the deck
            var position = Int(arc4random_uniform(UInt32(deck.count)))
            
            // Copy the card in this position to the player's hand
            Deck.playerHand.append(deck[position])
            
            // Remove the card from the deck for this position
            deck.remove(at: position)
            
            //print("There are \(deck.count) cards left in the deck")
        }
        
        while deck.count > 48 && deck.count < 51 {
            
            // Generate a random number between 0 and the count of cards still left in the deck
            var position = Int(arc4random_uniform(UInt32(deck.count)))
            
            // Copy the card in this position to the player's hand
            Deck.dealerHand.append(deck[position])
            
            // Remove the card from the deck for this position
            deck.remove(at: position)
            
            //print("There are \(deck.count) cards left in the deck")
        }
        
        // Print the player their cards
        print("Your cards are \(Suit.glyph(forHashValue: Deck.playerHand[0].suit))\(Deck.playerHand[0].value) and \(Suit.glyph(forHashValue: Deck.playerHand[1].suit))\(Deck.playerHand[1].value)\n")
        
    }
    
    func gun21() {
        print("Blackjack to the dealer!\n")
    }
    
    func tie() {
        print("Push\n")
    }
    
    func checkForBlackjack(){
        if playerHandCount == 21 {
            print("BLACKJACK!\n")
        }
        
        if dealerHandCount == 21 {
            print("Blackjack to the dealer\n")
        }
    }
    
    func dealerTotal(){
        dealerHandCount = 0
        
        // Itterate over the dealers hand
        for (index, card) in Deck.dealerHand.enumerated() {
            
            // If the card is a J, Q or K, only add 10 to count
            if card.value > 10 {
                
                dealerHandCount += 10
                
            } else {
                dealerHandCount += card.value
            }
        }
        
        print ("The dealers cards total to \(dealerHandCount)\n")
        
        if dealerHandCount < playerHandCount {
            dealToDealer()
        } else if dealerHandCount == playerHandCount {
            print("Push\n")
        } else if dealerHandCount > playerHandCount && dealerHandCount == 21 {
            checkForBlackjack()
        }
    }
    
    // Toal the players cards by itterating over them
    func playerTotal(){
        
        // Reset the count
        playerHandCount = 0
        
        // Itterate over the players hand
        for (index, card) in Deck.playerHand.enumerated() {
            
            // If the card is a J, Q or K  only add 10 to count
            if card.value > 10 {
                
                playerHandCount += 10
                
            } else {
                playerHandCount += card.value
            }
        }
    }
    
    func statePlayerTotal(){
        print("Your cards total to \(playerHandCount)\n")
    }
    
    func stateTotals(){
        print("Your cards total to \(playerHandCount)\n")
        print("The dealers showing card is \(Suit.glyph(forHashValue: Deck.dealerHand[0].suit))\(Deck.dealerHand[0].value)\n")
    }
    
    func dealToDealer(){
        
        // Generate a random number between 0 and the count of cards still left in the deck
        var position = Int(arc4random_uniform(UInt32(deck.count)))
        
        // Copy the card in this position to the player's hand
        Deck.dealerHand.append(deck[position])
        
        // Remove the card from the deck for this position
        deck.remove(at: position)
        
        //print("There are \(deck.count) cards left in the deck")
        
        print("The dealer fliped a \(Suit.glyph(forHashValue: Deck.dealerHand[Deck.dealerHand.count - 1].suit))\(Deck.dealerHand[Deck.dealerHand.count - 1].value)\n")
        
        Game.dealerTotal()
        
    }
    
    func stateDealersFace(){
        print("The dealers showing card is \(Suit.glyph(forHashValue: Deck.dealerHand[0].suit))\(Deck.dealerHand[0].value)\n")
    }
    
    func flipDealerCard(){
        print("The dealer fliped a \(Suit.glyph(forHashValue: Deck.dealerHand[1].suit))\(Deck.dealerHand[1].value)\n")
        dealerTotal()
    }
    
    func checkForBust(){
        if playerHandCount > 21 {
            print("Bust!\n")
        }
        
        if playerHandCount < 21 {
            Response.question()
        }
    }
    
    // Add a card to the players hand
    func hit(){
        
        //print("Player Hit")
        
        var position = Int(arc4random_uniform(UInt32(deck.count)))
        
        // Copy the card in this position to the player's hand
        Deck.playerHand.append(deck[position])
        
        // Remove the card from the deck for this position
        deck.remove(at: position)
        
        //print("\nThere are \(deck.count) cards left in the deck")
        
        print("You recieved a \(Suit.glyph(forHashValue: Deck.playerHand[Deck.playerHand.count - 1].suit))\(Deck.playerHand[Deck.playerHand.count - 1].value)\n")
        
        playerTotal()
        
        print("Your cards total to \(playerHandCount)\n")
        
        checkForBust()
        checkForBlackjack()
    }
    
    func stand(){
        
        //print("Player Stands")
        
        flipDealerCard()
        
    }
    
    func checkWinner(){
        
        if playerHandCount > dealerHandCount && playerHandCount < 21 {
            print("You win!\n")
        } else if dealerHandCount > playerHandCount && dealerHandCount < 21 {
            print("Dealer wins\n")
        }
        
        if dealerHandCount > 21 {
            print("Bust\n\nYou win!\n")
        }
        
        
    }
    
    func resetHands() {
        
        Deck.playerHand.removeAll()
        
        Deck.dealerHand.removeAll()
        
    }
    
    func endGame(){
        print("Thanks for playing!")
    }

}
