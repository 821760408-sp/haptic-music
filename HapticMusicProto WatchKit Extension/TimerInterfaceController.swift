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

    var hapticTimers = [NSTimer]()
    var hapticType = WKHapticType.DirectionUp //: WKHapticType!
    var hapticTypeTest: WKHapticType!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        if let trackNum: AnyObject = context {

            let date = NSDate(timeIntervalSinceNow: trackLengths[trackNum as! Int] )

            pbInterfaceTimer.setDate(date)
            pbInterfaceTimer.start()

            var timeInterval = 0.5
            let TIME_INC_REGULAR = 1.0 //0.5
            let TIME_INC_NOTIFICATION = 1.0
            let TIME_INC_RETRY = 1.15 //0.65
            let TIME_BEAT_GAP = 1.0

            switch trackNum as! Int {

            case 0:
                //( tt . lv . lt . ttt ) * 4
                for _ in 1...4 {

                    hapticType = WKHapticType.DirectionUp
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHaptic", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR
//                    hapticType = .Retry
                    hapticTypeTest = .Retry
//                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHaptic", userInfo: nil, repeats: false))
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTest", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_RETRY
                    hapticType = .Start
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHaptic", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR
                    hapticType = .Success
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHaptic", userInfo: nil, repeats: false))
                    
                    timeInterval += TIME_INC_REGULAR
                    timeInterval += TIME_BEAT_GAP
                }

                //( lt . lv . ltlt . lt ) * 4
                for _ in 1...4 {
                    hapticType = .Start
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHaptic", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR
                    hapticType = .Retry
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHaptic", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_RETRY
                    hapticType = .Stop
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHaptic", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR
                    hapticType = .Start
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHaptic", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR
                    timeInterval += TIME_BEAT_GAP
                }

            case 1: hapticType = .DirectionUp   // Tap-Tap
            case 2: hapticType = .DirectionDown // Tap-Tap
            case 3: hapticType = .Success       // Tap-Tap-Tap
            case 4: hapticType = .Failure       // Long Vibrate
            case 5: hapticType = .Retry         // Long Vibrate
            case 6: hapticType = .Start         // Long Tap
            case 7: hapticType = .Stop          // Long Tap-Long Tap
            case 8: hapticType = .Click         // Light Tap
            default: break

            }
        }
    }

    func playHaptic() {
        device.playHaptic(hapticType)
    }

    func playHapticTest() {
        device.playHaptic(hapticTypeTest!)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        for timer in hapticTimers {
            if timer.valid {
                timer.invalidate()
            }
        }
    }

}
