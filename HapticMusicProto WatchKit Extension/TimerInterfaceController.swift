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
    
    let trackLengths: [Double] = [60.0, 60.0, 60.0, 60.0, 90.0, 120.0, 120.0, 120.0, 120.0]

    var hapticTimer: NSTimer!
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

            hapticTimer = NSTimer.scheduledTimerWithTimeInterval(
//                1,
//                0.5,
                0.25,
                target: self,
                selector: Selector("playHaptic"),
                userInfo: nil,
                repeats: true)

            // TODO: use patterns of non-repeats NSTimer to compose haptic feedbacks
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
        hapticTimer.invalidate()
    }

}
