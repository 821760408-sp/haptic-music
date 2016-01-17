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

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        if let trackNum: AnyObject = context {

            let date = NSDate(timeIntervalSinceNow: trackLengths[trackNum as! Int] )

            pbInterfaceTimer.setDate(date)
            pbInterfaceTimer.start()

            var timeInterval = 0.5
            let TIME_INC_REGULAR = 0.5
//            let TIME_INC_NOTIFICATION = 1.0
            let TIME_INC_STOP = 0.65
            let TIME_BEAT_GAP = 1.0

            switch trackNum as! Int {

            case 0:
                //( tt . lv . lt . ttt ) * 4
                for _ in 1...4 {

                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticDirectionUp", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR

                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticRetry", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR

                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticStart", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR

                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticSuccess", userInfo: nil, repeats: false))
                    
                    timeInterval += TIME_INC_REGULAR
                    timeInterval += TIME_BEAT_GAP
                }

                //( lt . lv . ltlt . lt ) * 4
                for _ in 1...4 {

                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticStart", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR

                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticRetry", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR

                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticStop", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_STOP

                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticStart", userInfo: nil, repeats: false))

                    timeInterval += TIME_INC_REGULAR
                    timeInterval += TIME_BEAT_GAP
                }

//            case 1:

            default: break

            }
        }
    }

    func playHapticNotification() { device.playHaptic(.Notification) }
    func playHapticDirectionUp()  { device.playHaptic(.DirectionUp) }
    func playHapticSuccess()      { device.playHaptic(.Success) }
    func playHapticRetry()        { device.playHaptic(.Retry) }
    func playHapticStart()        { device.playHaptic(.Start) }
    func playHapticStop()         { device.playHaptic(.Stop) }
    func playHapticClick()        { device.playHaptic(.Click) }


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
