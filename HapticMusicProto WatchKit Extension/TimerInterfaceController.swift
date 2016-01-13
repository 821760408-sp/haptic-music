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

    @IBOutlet var pbInterfaceTimer: WKInterfaceTimer!
    
    let device = WKInterfaceDevice.currentDevice()
    
    let trackLengths = [10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0]

//    var hapticTimer: NSTimer!
    var hapticTimers = [NSTimer]()
    var hapticType: WKHapticType!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        if let trackNum: AnyObject = context {

            let date = NSDate(timeIntervalSinceNow: trackLengths[trackNum as! Int] )

            pbInterfaceTimer.setDate(date)
            pbInterfaceTimer.start()

            switch trackNum as! Int {

            case 0: hapticType = WKHapticType.Notification  // Tap-Tap-Vibrate
            case 1: hapticType = WKHapticType.DirectionUp   // Tap-Tap
            case 2: hapticType = WKHapticType.DirectionDown // Tap-Tap
            case 3: hapticType = WKHapticType.Success       // Tap-Tap-Tap
            case 4: hapticType = WKHapticType.Failure       // Long Vibrate
            case 5: hapticType = WKHapticType.Retry         // Long Vibrate
            case 6: hapticType = WKHapticType.Start         // Long Tap
            case 7: hapticType = WKHapticType.Stop          // Long Tap-Long Tap
            case 8: hapticType = WKHapticType.Click         // Light Tap
            default: break

            }
            
            /* experimental: the shortest period of pattern re-generation capability */
            
            // method 1: creating and scheduling one repeating timer, and destroying it upon existing scene
//            hapticTimer = NSTimer.scheduledTimerWithTimeInterval(
//                //                1,
//                //                0.5,
//                //                0.25,
//                0.1,
//                target: self,
//                selector: Selector("playHaptic"),
//                userInfo: nil,
//                repeats: true)
            
            // method 2: creating and scheduling multiple timers, and destroying them upon existing scene
            var timeInterval = 1.0
            let timeIncrement = 0.1
            let howMany: Int = Int(trackLengths[trackNum as! Int] / timeIncrement)
            // .Notification:  spanning ~1 sec
            // .DirectionUp:   use 0.1 sec will feel almost like 4/4
            // .DirectionDown: (equivalent to .DirectionUp)
            // .Success:       use 0.1 sec will feel almost like 8/8
            // .Failure:       ?
            // .Retry:         (equivalent to .Failure)
            // .Start:         ?
            // .Stop:          use 0.1 sec will feel like longer version of .DirectionUp
            // .Click:         use 0.1 sec will feel like weaker version of .DirectionUp
            
            for _ in 1...howMany {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(
                        timeInterval,
                        target: self,
                        selector: Selector("playHaptic"),
                        userInfo: nil,
                        repeats: false))
                    timeInterval += timeIncrement
            }

            // TODO: use patterns of non-repeats NSTimer to compose haptic feedbacks
            // TODO: invent new notation for composition: indicate clearly the time inverval between the atomic rhythm/haptic-patterns
        }
    }

    func playHaptic() {
        device.playHaptic(hapticType!)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
//        hapticTimer.invalidate()
        for (i, timer) in hapticTimers.enumerate() {
            if timer.valid {
                NSLog("timer firedate of \(i): %@", timer.fireDate)
                timer.invalidate()
            }
        }
    }

}
