//
//  ViewController.swift
//  GamerAppAtlas
//
//  Created by Dimitris Tasios on 13/11/2018.
//  Copyright © 2018 Dimitris Tasios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var LoadingPercentage: UILabel!
    var timer = Timer()
    var percentage = 0

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.015, target: self,   selector: (#selector(ViewController.updatePercentage)), userInfo: nil, repeats: true)
    }
    
    @objc func updatePercentage(){
        
        percentage += 1
        LoadingPercentage.text = "\(percentage)%"
        if(percentage>=100){
            timer.invalidate()
            performSegue(withIdentifier: "goToHomeScreen", sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
//        var timer : Time
//        timer.fire()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

