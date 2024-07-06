//
//  HomePageViewController.swift
//  SingletonExample
//
//  Created by nishu nishantaS on 10/05/19.
//  Copyright © 2019 nishu nishantaS. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    var timeLeft = 60
    var timer:Timer?
    var event:UIEvent?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
    }
    func logout(){
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func logoutButtonAction(_ sender: Any) {
        
        self.logout()
        
    }
    @objc func fire()
    {
        print("FIRE!!!")
        timeLeft -= 1
        if let touches = event?.allTouches {
            for touch in touches where touch.phase == UITouch.Phase.began {
                self.resetIdleTimer()
            }
        }
        if(timeLeft < 0){
            
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
    }
    private func resetIdleTimer() {
        
        timer?.invalidate()
        }
    
}
