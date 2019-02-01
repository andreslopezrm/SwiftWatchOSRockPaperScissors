//
//  InterfaceController.swift
//  RockPaperScissorsSwift WatchKit Extension
//
//  Created by Andres Lopez on 1/31/19.
//  Copyright © 2019 Andres Lopez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var oponentLabel: WKInterfaceLabel!
    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    @IBOutlet weak var counterLabel: WKInterfaceLabel!
    @IBOutlet weak var timer: WKInterfaceTimer!
    
    @IBOutlet weak var rockButton: WKInterfaceButton!
    @IBOutlet weak var paperButton: WKInterfaceButton!
    @IBOutlet weak var scissorsButton: WKInterfaceButton!
    
    let options = ["rock", "paper", "scissors"]
    var counter = 0
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        rockButton.setBackgroundImage(UIImage(named: "rock"))
        paperButton.setBackgroundImage(UIImage(named: "paper"))
        scissorsButton.setBackgroundImage(UIImage(named: "scissors"))
        
        timer.start()
    }
    
    @IBAction func rock() {
        check("rock")
    }
    
    @IBAction func paper() {
        check("paper")
    }
    
    @IBAction func scissors() {
        check("scissors")
    }
    
    func check(_ selection: String) {
        
        let ramdomOptions = options.shuffled()
        let machineChoose = ramdomOptions[0]
        
        if (selection == machineChoose) {
            resultLabel.setText("TIE")
            
        } else if (selection == "rock" && machineChoose == "scissors"){
            resultLabel.setText("WIN")
            counter += 1
        } else if (selection == "rock" && machineChoose == "paper") {
            resultLabel.setText("LOSE")
        } else if (selection == "paper" && machineChoose == "rock") {
            resultLabel.setText("WIN")
            counter += 1
        } else if (selection == "paper" && machineChoose == "scissors") {
            resultLabel.setText("LOSE")
        } else if (selection == "scissors" && machineChoose == "paper") {
            resultLabel.setText("WIN")
            counter += 1
        } else if (selection == "scissors" && machineChoose == "rock") {
            resultLabel.setText("LOSE")
        }
        
        counterLabel.setText("Wins: \(counter)")
        oponentLabel.setText("Oponent: \(machineChoose)")
    }
    
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

}
