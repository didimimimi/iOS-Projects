//
//  HomeScreenViewController.swift
//  GamerAppAtlas
//
//  Created by Dimitris Tasios on 13/11/2018.
//  Copyright © 2018 Dimitris Tasios. All rights reserved.
///

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var NewGameButton: UIButton!
    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var CreditsButton: UIButton!
    
    @IBOutlet weak var Title1: UILabel!
    @IBOutlet weak var LogoG: UILabel!
    @IBOutlet weak var LogoA: UILabel!
    @IBOutlet weak var LogoPicture: UIImageView!
    @IBOutlet weak var LogoE: UILabel!
    @IBOutlet weak var LogoR: UILabel!
    
    @IBOutlet weak var LevelA: UILabel!
    @IBOutlet weak var LevelB: UILabel!
    
    @IBOutlet weak var PlayerA: UILabel!
    @IBOutlet weak var PlayerB: UILabel!
    
    @IBOutlet weak var ScoreA: UILabel!
    @IBOutlet weak var ScoreB: UILabel!
    
    @IBOutlet weak var CopyrightA: UILabel!
    @IBOutlet weak var CopyrightB: UILabel!
    @IBOutlet weak var CopyrightC: UILabel!
    
    var timer = Timer()
    var label = 1
    var first = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.LevelA.isHidden = true
        self.LevelB.isHidden = true
        self.PlayerA.isHidden = true
        self.PlayerB.isHidden = true
        self.ScoreA.isHidden = true
        self.ScoreB.isHidden = true
        self.Title1.isHidden = true
        self.LogoG.isHidden = true
        self.LogoA.isHidden = true
        self.LogoPicture.isHidden = true
        self.LogoE.isHidden = true
        self.LogoR.isHidden = true
        self.NewGameButton.isHidden = true
        self.ContinueButton.isHidden = true
        self.CreditsButton.isHidden = true
        self.CopyrightA.isHidden = true
        self.CopyrightB.isHidden = true
        self.CopyrightC.isHidden = true
        
        self.LevelA.center.x -= view.bounds.width
        self.LevelB.center.x -= view.bounds.width
        self.PlayerA.center.y -= view.bounds.height
        self.PlayerB.center.y -= view.bounds.height
        self.ScoreA.center.x  += view.bounds.width
        self.ScoreB.center.x += view.bounds.width
        self.Title1.center.x -= view.bounds.width
        self.LogoG.center.y -= view.bounds.height
        self.LogoA.center.y -= view.bounds.height
        self.LogoPicture.center.y -= view.bounds.height
        self.LogoE.center.y -= view.bounds.height
        self.LogoR.center.y -= view.bounds.height
        self.NewGameButton.center.x -= view.bounds.width
        self.ContinueButton.center.x += view.bounds.width
        self.CreditsButton.center.y += view.bounds.height
        self.CopyrightA.center.y += view.bounds.height
        self.CopyrightB.center.y += view.bounds.height
        self.CopyrightC.center.y += view.bounds.height
        // Do any additional setup after loading the view.
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.runTimer()
    }

    func runTimer() {
        if(first){
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self,   selector: (#selector(HomeScreenViewController.showLabels)), userInfo: nil, repeats: true)
        } else{
            timer.invalidate()

        }
        
    }
    
    @objc func showLabels(){
        switch label {
        case 1:
            self.Title1.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self.Title1.center.x += self.view.bounds.width
            })
            label += 1
        case 2:
            self.LogoG.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self.LogoG.center.y += self.view.bounds.height
            })
            label += 1
        case 3:
            self.LogoA.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self.LogoA.center.y += self.view.bounds.height
            })
            label += 1
        case 4:
            self.LogoE.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self.LogoE.center.y += self.view.bounds.height
            })
            label += 1
        case 5:
            self.LogoR.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self.LogoR.center.y += self.view.bounds.height
            })
            label += 1
        case 6:
            self.LogoPicture.isHidden = false
            UIView.animate(withDuration: 1.5, animations: {
                self.LogoPicture.center.y += self.view.bounds.height
            })
            first = false
            label += 1
        case 7:
            label += 2
        case 9:
            first = true
            label += 2
        case 11:
            self.NewGameButton.isHidden = false
            UIView.animate(withDuration: 0.25, animations: {
                self.NewGameButton.center.x += self.view.bounds.width
            })
            label += 1
        case 12:
            self.ContinueButton.isHidden = false
            UIView.animate(withDuration: 0.25, animations: {
                self.ContinueButton.center.x -= self.view.bounds.width
            })
            label += 1
        case 13:
            self.CreditsButton.isHidden = false
            UIView.animate(withDuration: 0.25, animations: {
                self.CreditsButton.center.y -= self.view.bounds.height
            })
            label += 1
        case 14:
            self.LevelA.isHidden = false
            self.LevelB.isHidden = false
            self.PlayerA.isHidden = false
            self.PlayerB.isHidden = false
            self.ScoreA.isHidden = false
            self.ScoreB.isHidden = false
            self.CopyrightA.isHidden = false
            self.CopyrightB.isHidden = false
            self.CopyrightC.isHidden = false
            
            UIView.animate(withDuration: 0.3, animations: {
                self.LevelA.center.x += self.view.bounds.width
                self.LevelB.center.x += self.view.bounds.width
                self.PlayerA.center.y += self.view.bounds.height
                self.PlayerB.center.y += self.view.bounds.height
                self.ScoreA.center.x -= self.view.bounds.width
                self.ScoreB.center.x -= self.view.bounds.width
                self.CopyrightA.center.y -= self.view.bounds.height
                self.CopyrightB.center.y -= self.view.bounds.height
                self.CopyrightC.center.y -= self.view.bounds.height
            })
            label += 1
        default:
            first = false
            
        }
        
    }
    
    /*
     
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
