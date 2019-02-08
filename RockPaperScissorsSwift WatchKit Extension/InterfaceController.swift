//
//  InterfaceController.swift
//  RockPaperScissorsSwift WatchKit Extension
//
//  Created by Andres Lopez on 1/31/19.
//  Copyright © 2019 Andres Lopez. All rights reserved.
//

import WatchKit
import Foundation


enum Moves: String {
    case rock
    case paper
    case scissors
}

enum Results: String {
    case tie = "TIE"
    case win = "WIN"
    case lose = "LOSE"
}


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var oponentLabel: WKInterfaceLabel!
    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    @IBOutlet weak var counterLabel: WKInterfaceLabel!
    @IBOutlet weak var timer: WKInterfaceTimer!
    
    @IBOutlet weak var rockButton: WKInterfaceButton!
    @IBOutlet weak var paperButton: WKInterfaceButton!
    @IBOutlet weak var scissorsButton: WKInterfaceButton!
    
    let options = [Moves.rock, Moves.paper, Moves.scissors]
    var counter = 0
    
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        
        rockButton.setBackgroundImage(UIImage(named: Moves.rock.rawValue))
        paperButton.setBackgroundImage(UIImage(named: Moves.paper.rawValue))
        scissorsButton.setBackgroundImage(UIImage(named: Moves.scissors.rawValue))
        
        timer.start()
    }
    
    @IBAction func rock() {
        check(Moves.rock)
    }
    
    @IBAction func paper() {
        check(Moves.paper)
    }
    
    @IBAction func scissors() {
        check(Moves.scissors)
    }
    
    func check(_ selection: Moves) {
        
        let ramdomOptions = options.shuffled()
        let machineChoose = ramdomOptions[0]
        
        if (selection == machineChoose) {
            resultLabel.setText(Results.tie.rawValue)
            
        } else if (selection == .rock && machineChoose == .scissors){
            resultLabel.setText(Results.win.rawValue.uppercased())
            counter += 1
        } else if (selection == .rock && machineChoose == .paper) {
            resultLabel.setText(Results.lose.rawValue)
        } else if (selection == .paper && machineChoose == .rock) {
            resultLabel.setText(Results.win.rawValue)
            counter += 1
        } else if (selection == .paper && machineChoose == .scissors) {
            resultLabel.setText(Results.lose.rawValue)
        } else if (selection == .scissors && machineChoose == .paper) {
            resultLabel.setText(Results.win.rawValue)
            counter += 1
        } else if (selection == .scissors && machineChoose == .rock) {
            resultLabel.setText(Results.lose.rawValue)
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
