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
    
    let trackLengths: [Double] = [ 20.0, 20.0, 20.0, 20.0, 20.0, 20.0 ]

    var hapticTimer1: NSTimer!
    var hapticTimer2: NSTimer!
    var hapticType1: WKHapticType! = WKHapticType.Click // Light Tap
    var hapticType2: WKHapticType!
    var hapticTimers1 = [NSTimer]()
    var hapticTimers2 = [NSTimer]()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        if let trackNum: AnyObject = context {

            let date = NSDate(timeIntervalSinceNow: trackLengths[trackNum as! Int] )

            pbInterfaceTimer.setDate(date)
            pbInterfaceTimer.start()

            var timeInterval1 = 0.0
            var timeIncrement1 = 1.0
            var timeInterval2 = 0.5
            var timeIncrement2 = 1.0

            switch trackNum as! Int {

            case 0:
                hapticType2 = WKHapticType.Notification // Tap-Tap-Vibrate
                timeIncrement1 = 1.5
                timeIncrement2 = 1.5
            case 1:
                hapticType2 = WKHapticType.DirectionUp  // Tap-Tap
            case 2:
                hapticType2 = WKHapticType.Success      // Tap-Tap-Tap
            case 3:
                hapticType2 = WKHapticType.Failure      // Long Vibrate
            case 4:
                hapticType2 = WKHapticType.Start        // Long Tap
            case 5:
                hapticType2 = WKHapticType.Stop         // Long Tap-Long Tap
                timeIncrement1 = 1.15
                timeIncrement2 = 1.15
            default: break

            }

            let howMany: Int = ( Int )( trackLengths[ trackNum as! Int ] / timeIncrement1 )

            for _ in 1...howMany {

                hapticTimers1.append(NSTimer.scheduledTimerWithTimeInterval(
                    timeInterval1,
                    target: self,
                    selector: "playHaptic1",
                    userInfo: nil,
                    repeats: false))

                hapticTimers2.append(NSTimer.scheduledTimerWithTimeInterval(
                    timeInterval2,
                    target: self,
                    selector: "playHaptic2",
                    userInfo: nil,
                    repeats: false))

                timeInterval1 += timeIncrement1
                timeInterval2 += timeIncrement2

                //TODO: put everything into arrays
            }

            // TODO: use patterns of non-repeats NSTimer to compose haptic feedbacks
        }
    }

    func playHaptic1() {
        device.playHaptic(hapticType1!)
    }

    func playHaptic2() {
        device.playHaptic(hapticType2!)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        for timer1 in hapticTimers1 {
            if timer1.valid {
                timer1.invalidate()
            }
        }
        for timer2 in hapticTimers2 {
            if timer2.valid {
                timer2.invalidate()
            }
        }
    }

}
