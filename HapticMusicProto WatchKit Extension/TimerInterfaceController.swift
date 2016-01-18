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
    
    let trackLengths: [Double] = [10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 60.0, 60.0, 60.0, 60.0, 60.0, 60.0, 60.0]

    var hapticTimers = [NSTimer]()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        if let trackNum: AnyObject = context {

            let date = NSDate(timeIntervalSinceNow: trackLengths[trackNum as! Int] )

            pbInterfaceTimer.setDate(date)
            pbInterfaceTimer.start()

            var timeInterval = 0.5
            let TIME_INC_REGULAR = 0.5 // use any value < ~0.25 will guarantee a single effect -> seamlessly repeats
            let TIME_INC_TAPTAPVIBRATE = 1.0
            let TIME_INC_LONGTAP = 0.75
//            let TIME_BEAT_GAP = 1.0

            switch trackNum as! Int {

            case 0:
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapVibrate", userInfo: nil, repeats: true))
            case 1:
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: true))
            case 2:
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: true))
            case 3:
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: true))
            case 4:
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: true))
            case 5:
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: true))
            case 6:
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: true))

            case 7: // track 1

                // 1st 4 bars
//                for _ in 1...3 {
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                }
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                for _ in 1...2 {
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                }
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR

                /* lt v ttt lt, lt v ttt lt, lt v ttt lt, lt v ttt lt */
                for _ in  1...4 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }

                // 2nd 4 bars
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR

                /* lt v tt lt, lt v tt lt, lt v tt lt, lt v tt lt */
                for _ in  1...4 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }

                // 3rd 4 bars
//                for _ in 1...4 {
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_TAPTAPVIBRATE
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                }

                /* lt c ttt lt, lt c ttt lt, lt ~ ttt lt, lt ~ ttt lt */
                for _ in  1...2 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }
                for _ in  1...2 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }

                // 4th 4 bars
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR

                /* lt c tt lt, lt c tt lt, lt ~ tt lt, lt ~ tt lt, */
                for _ in  1...2 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }
                for _ in  1...2 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }

                // 5th 4 bars
//                for _ in 1...2 {
//                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                    timeInterval += TIME_INC_REGULAR
//                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
//                    timeInterval += TIME_INC_REGULAR
//                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                    timeInterval += TIME_INC_REGULAR
//                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
//                    timeInterval += TIME_INC_REGULAR
//                }
//                for _ in 1...2 {
//                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                    timeInterval += TIME_INC_REGULAR
//                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                    timeInterval += TIME_INC_REGULAR
//                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
//                    timeInterval += TIME_INC_REGULAR
//                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                    timeInterval += TIME_INC_REGULAR
//                }

                /* lt lt-lt ttt v, lt lt-lt ttt v, lt lt-lt ttt v, lt lt-lt */
                for _ in  1...3 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_LONGTAP
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                timeInterval += TIME_INC_REGULAR
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
                timeInterval += TIME_INC_LONGTAP

                // 6th 4 bars
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR

                /* lt lt-lt ttt v, lt lt-lt ttt v, lt lt-lt ttt v, lt lt-lt */
                for _ in  1...3 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_LONGTAP
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                timeInterval += TIME_INC_REGULAR
                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
                timeInterval += TIME_INC_LONGTAP


                // 7th 4 bars
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_TAPTAPVIBRATE
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_TAPTAPVIBRATE

                /* lt v ttt v, lt v ttt v, lt v ttt v, lt v ttt v */
                for _ in  1...4 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }


                // 8th 4 bars
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticLongTap2", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_LONGTAP
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticClick", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
//                hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticTapTapTap", userInfo: nil, repeats: false))
//                timeInterval += TIME_INC_REGULAR
                for _ in 1...16 {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
                    timeInterval += 0.2
                }

            case 8:
                let howMany = (Int)(trackLengths[trackNum as! Int] / TIME_INC_REGULAR)
                for _ in 1...howMany {
                    hapticTimers.append(NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "playHapticVibrate", userInfo: nil, repeats: false))
                    timeInterval += TIME_INC_REGULAR
                }

            default: break

            }
        }
    }

    func playHapticTapTapVibrate() { device.playHaptic(.Notification) }
    func playHapticTapTap()        { device.playHaptic(.DirectionUp) }
    func playHapticTapTapTap()     { device.playHaptic(.Success) }
    func playHapticVibrate()       { device.playHaptic(.Retry) }
    func playHapticLongTap()       { device.playHaptic(.Start) }
    func playHapticLongTap2()      { device.playHaptic(.Stop) }
    func playHapticClick()         { device.playHaptic(.Click) }


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
