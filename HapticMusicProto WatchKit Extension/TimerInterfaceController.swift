//
//  TimerInterfaceController.swift
//  HapticMusicProto
//
//  Created by Yuan Gao on 1/7/16.
//  Copyright © 2016 JuanGotama. All rights reserved.
//

import WatchKit
import Foundation


class TimerInterfaceController: WKInterfaceController {

    @IBOutlet var playbackTimer: WKInterfaceTimer!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        if let duration: AnyObject = context {
            let date = NSDate(timeIntervalSinceNow: duration as! NSTimeInterval)
            playbackTimer.setDate(date)
            playbackTimer.start()
            playAlert();
        }
    }
    
    func playAlert() {
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("playHaptic"), userInfo: nil, repeats: false)
    
    }
    
    func playHaptic() {
        
        let device = WKInterfaceDevice.currentDevice()
        device.playHaptic(.Notification)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
