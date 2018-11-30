//
//  CounterButton.swift
//  Counter
//
//  Created by Dimitris Tasios on 20/11/2018.
//  Copyright © 2018 Dimitris Tasios. All rights reserved.
//

import UIKit

class CounterButton {
    
    init(buttontype: String, thebutton: UIButton) {
        thebutton.layer.cornerRadius = 10
        //thebutton.layer.borderWidth = 2
        
        switch buttontype{
        case "number":
            thebutton.layer.backgroundColor = UIColor.init(red: 0.25490196078, green: 0.25490196078, blue: 0.25490196078, alpha: 1.0).cgColor
        case "operation":
            thebutton.layer.backgroundColor = UIColor.init(red: 0.60784313725, green: 0.33725490196, blue: 0.62352941176, alpha: 1.0).cgColor
        case "addition":
            thebutton.layer.backgroundColor = UIColor.init(red: 0.05882352941, green: 0.85882352941, blue: 0.05882352941, alpha: 1.0).cgColor
        case "substraction":
            thebutton.layer.backgroundColor = UIColor.init(red: 0.85882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1.0).cgColor
        default:
            thebutton.layer.backgroundColor = UIColor.black.cgColor
        }
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
