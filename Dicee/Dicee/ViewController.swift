//
//  ViewController.swift
//  Dicee
//
//  Created by RamySabry on 2/21/18.
//  Copyright © 2018 ramysabry. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    var score : Int = 0
    var tried : Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var triedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    func updateDiceImages(){
        
        randomDiceIndex1 = Int(arc4random_uniform(5))
        randomDiceIndex2 = Int(arc4random_uniform(5))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
        if(randomDiceIndex1 == randomDiceIndex2){
            let alert = UIAlertController(title: "Congratulations", message: "You Win!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
            AudioServicesPlaySystemSound(1005)
            
            
            score = score + 1
            scoreLabel.text = "Score: " + String(score)
        }
        tried = tried + 1
        triedLabel.text = "Tried: " + String(tried)
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        updateDiceImages()
     
    }
}


