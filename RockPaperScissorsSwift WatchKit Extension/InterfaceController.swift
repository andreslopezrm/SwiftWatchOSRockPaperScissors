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

    @IBOutlet weak var opponentLabel: WKInterfaceLabel!
    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    @IBOutlet weak var counterLabel: WKInterfaceLabel!
    @IBOutlet weak var timer: WKInterfaceTimer!
    
    @IBOutlet weak var rockButton: WKInterfaceButton!
    @IBOutlet weak var paperButton: WKInterfaceButton!
    @IBOutlet weak var scissorsButton: WKInterfaceButton!
    

    enum Option: String {
        case rock
        case paper
        case scissors
        
        var image: UIImage? {
            return UIImage(named: rawValue)
        }
    }
    
    enum Result: String {
        case win = "WIN"
        case tie = "TIE"
        case lose = "LOSE"
        
        func update(label: WKInterfaceLabel) {
            label.setText(rawValue)
        }
    }

    
    let options: [Option] = [.rock, .paper, .scissors]
    var counter = 0
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        

        rockButton.setBackgroundImage(Option.rock.image)
        paperButton.setBackgroundImage(Option.paper.image)
        scissorsButton.setBackgroundImage(Option.scissors.image)

        
        timer.start()
    }
    
    @IBAction func rock() {

        check(.rock)
    }
    
    @IBAction func paper() {
        check(.paper)
    }
    
    @IBAction func scissors() {
        check(.scissors)
    }
    
    func check(_ selection: Option) {

        
        let randomOptions = options.shuffled()
        let machineChoose = randomOptions[0]
        let result: Result
        

        switch (selection, machineChoose) {
        case (.rock, .scissors),
             (.paper, .rock),
             (.scissors, .paper):
            result = .win
        case (.rock, .paper),
             (.paper, .scissors),
             (.scissors, .rock):
            result = .lose
        default:
            result = .tie
        }
            
        if result == .win {
            counter += 1

        }
            
        result.update(label: resultLabel)
        counterLabel.setText("Wins: \(counter)")
        opponentLabel.setText("Opponent: \(machineChoose)")
    }

}
