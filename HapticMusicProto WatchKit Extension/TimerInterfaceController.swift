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
    
    let device = WKInterfaceDevice.currentDevice()
    
    let trackLengths = [60.0, 60.0, 60.0, 60.0, 90.0, 120.0, 120.0, 120.0, 120.0]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        // if let duration: AnyObject = context {
        if let trackNum: AnyObject = context {
            let date = NSDate(timeIntervalSinceNow: trackLengths[trackNum as! Int] )
            playbackTimer.setDate(date)
            playbackTimer.start()
            switch trackNum as! Int {
            case 0:
                playAlert("playNotification")
            case 1:
                playAlert("playDirectionUp")
            case 2:
                playAlert("playDirectionDown")
            case 3:
                playAlert("playSuccess")
            case 4:
                playAlert("playFailure")
            case 5:
                playAlert("playRetry")
            case 6:
                playAlert("playStart")
            case 7:
                playAlert("playStop")
            case 8:
                playAlert("playClick")
            default: break
            }
        }
    }
    
    func playAlert(_selector: String) {
        
//        var fireTime: Double = 1
//        let timeInc: Double = 1
//        for _ in 1...10 {
//            NSTimer.scheduledTimerWithTimeInterval(fireTime, target: self, selector: Selector("playSuccess"), userInfo: nil, repeats: false)
//            fireTime += timeInc
//        }
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector(_selector), userInfo: nil, repeats: true)
        
    }
    
//    func playHaptic() {
//        
//        let device = WKInterfaceDevice.currentDevice()
//        device.playHaptic(.Notification)
//        
//    }
    
    func playNotification() {
        device.playHaptic(.Notification)
    }
    
    func playDirectionUp() {
        device.playHaptic(.DirectionUp)
    }
    
    func playDirectionDown() {
        device.playHaptic(.DirectionDown)
    }
    
    func playSuccess() {
        device.playHaptic(.Success)
    }
    
    func playFailure() {
        device.playHaptic(.Failure)
    }
    
    func playRetry() {
        device.playHaptic(.Retry)
    }
    
    func playStart() {
        device.playHaptic(.Start)
    }
    
    func playStop() {
        device.playHaptic(.Stop)
    }
    
    func playClick() {
        device.playHaptic(.Click)
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
