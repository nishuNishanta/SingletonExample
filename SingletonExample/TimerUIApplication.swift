//
//  TimerUIApplication.swift
//  SingletonExample
//
//  Created by nishu nishanta on 15/05/19.
//  Copyright © 2019 nishu nishanta. All rights reserved.
//

import Foundation
import UIKit

class TimerUIApplication: UIApplication{
    
    var obj = HomePageViewController()
    private var timeoutInSeconds: TimeInterval {
        
        return 60 * 3
    }
    private var idleTimer: Timer?
    
    // resent the timer because there was user interaction
    private func resetIdleTimer() {
        if let idleTimer = idleTimer {
            idleTimer.invalidate()
        }
        
        idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds,
                                         target: self,
                                         selector: #selector(TimerUIApplication.timeHasExceeded),
                                         userInfo: nil,
                                         repeats: false
        )
    }
    // if the timer reaches the limit as defined in timeoutInSeconds, post this notification
    @objc private func timeHasExceeded() {
        NotificationCenter.default.post(name: .appTimeout,
                                        object: nil
        )
       
       obj.logout()
        
    }
    override func sendEvent(_ event: UIEvent) {
        
        super.sendEvent(event)
        
        if idleTimer != nil {
            self.resetIdleTimer()
        }
        
        if let touches = event.allTouches {
            for touch in touches where touch.phase == UITouch.Phase.began {
                self.resetIdleTimer()
            }
        }
    }
    
}
