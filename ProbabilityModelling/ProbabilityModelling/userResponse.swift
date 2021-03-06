//
//  userResponse.swift
//  ProbabilityModelling
//
//  Created by Nicholas Jones on 2017-01-26.
//  Copyright © 2017 Nicholas Jones. All rights reserved.
//

import Foundation

class UserResponse {
    
    var response : Bool = false
    var responseString = "X"
    
// Ask the player if they would like to hit, stand, double or split
func question() {
    
    // Repeat until a proper response is given
    repeat {
        
        // Ask the question
        print("Would you like to hit or stand?\n")
        
        // If the user gives a response
        if let input = readLine(strippingNewline: true) {
            responseString = input
            
            print("")
            
            // If the player hits
            if responseString == "hit" || responseString == "Hit" {
                
                Game.hit()
                
                //print("Player Hit")
                response = true
                
            // If the player stands
            } else if responseString == "stand" || responseString == "Stand" {
                
                Game.stand()
                
                //print("Plater Stands")
                response = false
                
            } else {
                responseString = "X"
            }
        }
    } while responseString == "X"
    
}

    func playAgain() {
        
        // Repeat until a proper response is given
        repeat {
            
            print("Would you like to play again?\n")
            
            // If a response is given
            if let input = readLine(strippingNewline: true) {
                responseString = input
                
                print("")
                
                // If the player says yes
                if responseString == "yes" || responseString == "Yes" {

                    play()
                    response = true
                    
                    // If the player says no
                } else if responseString == "no" || responseString == "No" {
                    
                    Game.endGame()
                    
                    response = false
                    
                } else {
                    responseString = "X"
                }
            }
        } while responseString == "X"
        
    }

}
