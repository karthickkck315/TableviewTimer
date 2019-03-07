//
//  TableViewCell.swift
//  NewTimerPlay
//
//  Created by Apple on 13/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    var timer: Timer?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func calculateTimeRemaining(countdownTimer:(index: Int,
        createdAt: TimeInterval,
        duration: TimeInterval))
        -> Double {
            return Double((countdownTimer.createdAt + countdownTimer.duration) - Date().timeIntervalSince1970)
    }
    
    func configureCell(withCountdownTimer countdownTimer: ( index: Int, createdAt: TimeInterval, duration: TimeInterval)) {
        
        //let timeRemaining = self.calculateTimeRemaining(countdownTimer:countdownTimer)
        
        //self.label.text = "\(timeRemaining.timeRemainingFormatted())"
        
        if self.timer == nil {
            
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats:
            true) { timer in
                
                let newTime = self.calculateTimeRemaining(countdownTimer:
                    countdownTimer)
                
                if newTime <= 0 {
                    print(countdownTimer.index)
                    self.label.text = "Completed"
                } else {
                    self.label.text = newTime.timeRemainingFormatted()
                }
            }
        }
    }
    override func prepareForReuse() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
extension Double {
    func timeRemainingFormatted() -> String {
        
        let duration = TimeInterval(self)
        
        let formatter = DateComponentsFormatter()
        
        formatter.unitsStyle = .positional
        
        formatter.allowedUnits = [ .hour, .minute, .second ]
        
        formatter.zeroFormattingBehavior = [ .pad ]
        
        return formatter.string(from: duration) ?? ""
        
    }
}
