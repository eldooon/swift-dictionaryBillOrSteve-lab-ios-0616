//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    var facts : [String : [String]] = [:]
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        getRandomFact()
        showfact()
    }

    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func createFacts() {
        
        let steveJobFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                             "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                             "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                             "He was a pescetarian, meaning he ate no meat except for fish."]
        
        
        let billGatesFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                              "He scored 1590 (out of 1600) on his SATs.",
                              "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                              "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                              "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        facts.updateValue(steveJobFacts, forKey: "Steve Jobs")
        facts.updateValue(billGatesFacts, forKey: "Bill Gates")
        
    
        
    }
    
    func getRandomFact () -> (Person : String, Fact: String){
        
        var randomFact : (String, String) = ("","")
        
        if facts.indexForKey("Steve Jobs") != nil || facts.indexForKey("Bill Gates'") != nil{
            
            let random = randomPerson()
            
            if let person = facts[random] {
                
                randomFact = (random, person[randomNumberFromZeroTo(person.count)])
                
            }
            
        }
        
        else {
            randomFact = ("No key exist", "No facts here")
        }
        
        return randomFact
    }
    
    func showfact () {
        factLabel.text = getRandomFact().Fact
    }
    

    @IBAction func steveButton(sender: AnyObject) {
        
        if getRandomFact().Person == "Steve Jobs" {
            counter += 1
            scoreLabel.text = String(counter)
            getRandomFact()
            showfact()
            print ("CORRECT!")
        }
        
        else {
            print ("WRONG!")
            getRandomFact()
            showfact()
        }
        
    }
    
    @IBAction func billButton(sender: AnyObject) {
        if getRandomFact().Person == "Bill Gates" {
            counter += 1
            scoreLabel.text = String(counter)
            getRandomFact()
            showfact()
            print ("CORRECT!")
        }
        
        else {
            print ("WRONG!")
            getRandomFact()
            showfact()
        }
    }

}
