//
//  InterfaceController.swift
//  HapticMusicProto WatchKit Extension
//
//  Created by Juan Gotama on 1/6/16.
//  Copyright © 2016 JuanGotama. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // the outlet to the tracklist table
    @IBOutlet var tracklistTable: WKInterfaceTable!
    
    // for developing: disabel images will speed up testing on watch
    // let images = ["img1", "img2", "img3", "img4"]

    let names = ["Failure+Notification", "Failure+Direction", "Failure+Success", "Failure+Start", "Failure+Stop", "Failure+Click"]

    override init() {
        super.init()
        loadTable()
    }

    private func loadTable() {

        tracklistTable.setNumberOfRows(names.count, withRowType: "AudioTrackRowController")

        for (index, name) in names.enumerate() {

            let row = tracklistTable.rowControllerAtIndex(index) as! AudioTrackRowController
            row.trackName.setText(name)
            // for developing: disabel images will speed up testing on watch
            // row.trackImage.setImage(UIImage(named: images[index]))
            
        }

    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        // pushControllerWithName("PlaybackInterfaceController", context: nil)
        // TODO: pass into /context/ the rowIndex i.e. the track number also (as an array?)
        // pushControllerWithName("TimerInterfaceController", context: trackLength[rowIndex])
        pushControllerWithName("TimerInterfaceController", context: rowIndex)
    
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
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
