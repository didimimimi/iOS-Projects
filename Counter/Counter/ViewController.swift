//
//  ViewController.swift
//  Counter
//
//  Created by Dimitris Tasios on 20/11/2018.
//  Copyright © 2018 Dimitris Tasios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        //return UIStatusBarStyle.default   // Make dark again
    }
    
    var mainCounterValue = 0
    var temporaryCounterValue = 0
    var currentDigits = 0
    var lastTemporaryValue = 0
    var pastResults = [Int]()
    
    @IBOutlet weak var mainCounter: UILabel!
    @IBOutlet weak var temporaryCounter: UILabel!
    
    @IBOutlet weak var numberOneButton: UIButton!
    @IBOutlet weak var numberTwoButton: UIButton!
    @IBOutlet weak var numberThreeButton: UIButton!
    @IBOutlet weak var numberFourButton: UIButton!
    @IBOutlet weak var numberFiveButton: UIButton!
    @IBOutlet weak var numberSixButton: UIButton!
    @IBOutlet weak var numberSevenButton: UIButton!
    @IBOutlet weak var numberEightButton: UIButton!
    @IBOutlet weak var numberNineButton: UIButton!
    @IBOutlet weak var numberZeroButton: UIButton!
    
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var substractionButton: UIButton!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    
    @IBAction func CreditsButton(_ sender: Any) {
        openLinkedInPage()
    }
    
    
    @IBAction func numberOne(_ sender: Any) {
        self.insertCounterValue(insertValue: 1)
    }
    
    @IBAction func numberTwo(_ sender: Any) {
        self.insertCounterValue(insertValue: 2)
    }
    
    @IBAction func numberThree(_ sender: Any) {
        self.insertCounterValue(insertValue: 3)
    }
    
    @IBAction func numberFour(_ sender: Any) {
        self.insertCounterValue(insertValue: 4)
    }
    
    @IBAction func numberFive(_ sender: Any) {
        self.insertCounterValue(insertValue: 5)
    }
    
    @IBAction func numberSix(_ sender: Any) {
        self.insertCounterValue(insertValue: 6)
    }
    
    @IBAction func numberSeven(_ sender: Any) {
        self.insertCounterValue(insertValue: 7)
    }
    
    @IBAction func numberEight(_ sender: Any) {
        self.insertCounterValue(insertValue: 8)
    }
    
    @IBAction func numberNine(_ sender: Any) {
        self.insertCounterValue(insertValue: 9)
    }
    
    @IBAction func numberZero(_ sender: Any) {
        self.insertCounterValue(insertValue: 0)
    }
    
    @IBAction func addition(_ sender: Any) {
        self.updateMainCounter(adding: true,undo: false, theValue: self.temporaryCounterValue)
    }
    
    @IBAction func substraction(_ sender: Any) {
        self.updateMainCounter(adding: false,undo: false, theValue: self.temporaryCounterValue)

    }
    
    
    @IBAction func allClear(_ sender: Any) {
        self.resetEverything()
    }
    
    @IBAction func deleteDigit(_ sender: Any) {
        var counterInProgress = self.temporaryCounterValue
        if(self.currentDigits>0){

            self.currentDigits -= 1
            counterInProgress /= 10
            
        }
        self.temporaryCounterValue = counterInProgress
        self.temporaryCounter.text = "\(self.temporaryCounterValue)"
    }
    
    
    @IBAction func undo(_ sender: Any) {
        //print("\(self.pastResults.isEmpty) and i am \(pastResults)")
        if(!self.pastResults.isEmpty){
            var previousResult = self.pastResults.popLast()
//            if(previousResult! == self.mainCounterValue){
//                previousResult = self.pastResults.popLast()
//                if(self.pastResults.isEmpty){
//                    self.pastResults.append(0)
//                }
//            }
            if(previousResult! < 0){
                previousResult = -previousResult!
            }
            self.updateMainCounter(adding: true, undo: true, theValue: previousResult!)

        }else{
            self.resetEverything()
        }
        //print("\(self.pastResults.isEmpty) after all i am \(self.pastResults)")
    }
    
    func insertCounterValue(insertValue: Int) {
        var counterInProgress = self.temporaryCounterValue
        if(counterInProgress == 0) {
            self.currentDigits += 1
             counterInProgress = insertValue
        }
        else {
            
            if(self.currentDigits<6){
                self.currentDigits += 1
                counterInProgress = (counterInProgress * 10) + insertValue
            }
            
        }
        
        self.temporaryCounterValue = counterInProgress
        self.temporaryCounter.text = "\(self.temporaryCounterValue)"
    }
    
    func updateMainCounter(adding: Bool, undo: Bool, theValue: Int){
        
        if(undo){
            self.mainCounterValue = theValue
        } else{
            if(adding){
                self.pastResults.append(self.mainCounterValue)
                if(theValue == 0){
                    self.mainCounterValue += self.lastTemporaryValue
                } else {
                    self.mainCounterValue += theValue
                }
            } else {
                self.pastResults.append(-self.mainCounterValue)
                if(theValue == 0){
                    self.mainCounterValue -= self.lastTemporaryValue
                } else {
                    self.mainCounterValue -= theValue
                }
            }
        }
        
        if(self.mainCounterValue >= 0 && self.mainCounterValue <= 9){
            self.mainCounter.text = "00000\(self.mainCounterValue)"
        }
        else if(self.mainCounterValue >= 10 && self.mainCounterValue <= 99){
            self.mainCounter.text = "0000\(self.mainCounterValue)"
        }
        else if(self.mainCounterValue >= 100 && self.mainCounterValue <= 999){
            self.mainCounter.text = "000\(self.mainCounterValue)"
        }
        else if(self.mainCounterValue >= 1000 && self.mainCounterValue <= 9999){
            self.mainCounter.text = "00\(self.mainCounterValue)"
        }
        else if(self.mainCounterValue >= 10000 && self.mainCounterValue <= 99999){
            self.mainCounter.text = "0\(self.mainCounterValue)"
        }
        else if(self.mainCounterValue >= 100000 && self.mainCounterValue <= 999999){
            self.mainCounter.text = "\(self.mainCounterValue)"
        }
        else {
            if(!undo){
                if(adding){
                    self.mainCounterValue = 999999
                    self.mainCounter.text = "999999"
                } else {
                    self.mainCounterValue = 0
                    self.mainCounter.text = "000000"
                    
                }
            }
            
            
        }
//        if(!undo){
//            if(adding){
//                self.pastResults.append(self.mainCounterValue)
//                print("i added so i am \(pastResults)")
//            } else {
//                self.pastResults.append(-self.mainCounterValue)
//
//            }
//        }
        if(theValue != 0){
            self.lastTemporaryValue = theValue
        }
        self.temporaryCounterValue = 0
        self.temporaryCounter.text = "0"
        self.currentDigits = 0
    }
    
    func resetEverything(){
        self.mainCounter.text = "000000"
        self.mainCounterValue = 0
        self.temporaryCounter.text = "0"
        self.temporaryCounterValue = 0
        self.currentDigits = 0
    }
    
    func openLinkedInPage() {
        let linkedinURL = URL(string: "linkedin://profile/dimitris-tasios-437197111/")!
        if UIApplication.shared.canOpenURL(linkedinURL) {
            UIApplication.shared.open( linkedinURL)
        } else {
            UIApplication.shared.open(URL(string: "linkedin://profile/dimitris-tasios-437197111/")!)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CounterButton(buttontype: "number", thebutton: self.numberOneButton)
        CounterButton(buttontype: "number", thebutton: self.numberTwoButton)
        CounterButton(buttontype: "number", thebutton: self.numberThreeButton)
        CounterButton(buttontype: "number", thebutton: self.numberFourButton)
        CounterButton(buttontype: "number", thebutton: self.numberFiveButton)
        CounterButton(buttontype: "number", thebutton: self.numberSixButton)
        CounterButton(buttontype: "number", thebutton: self.numberSevenButton)
        CounterButton(buttontype: "number", thebutton: self.numberEightButton)
        CounterButton(buttontype: "number", thebutton: self.numberNineButton)
        CounterButton(buttontype: "number", thebutton: self.numberZeroButton)
        CounterButton(buttontype: "addition", thebutton: self.additionButton)
        CounterButton(buttontype: "substraction", thebutton: self.substractionButton)
        CounterButton(buttontype: "operation", thebutton: self.allClearButton)
        CounterButton(buttontype: "operation", thebutton: self.deleteButton)
        CounterButton(buttontype: "operation", thebutton: self.undoButton)
        
        self.restorationIdentifier = "ViewController"
        // Do any additional setup after loading the view, typically from a nib.

    }


}

