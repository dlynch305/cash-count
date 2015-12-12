//
//  ViewController.swift
//  cashcount
//
//  Created by Dylan Lynch on 12/2/15.
//  Copyright © 2015 Dylan Lynch. All rights reserved.
//

import UIKit

class CountViewController: UIViewController {
    
    // MARK: Properties
    // Wage
    @IBOutlet var totalEarnedLabel: UILabel!
    @IBOutlet var netEarnedLabel: UILabel!
    
    // Tax
    @IBOutlet var federalTaxLabel: UILabel!
    @IBOutlet var ssTaxLabel: UILabel!
    @IBOutlet var medicareTaxLabel: UILabel!

    // Time
    @IBOutlet var elapsedTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().idleTimerDisabled = true
        
        let RED   = UIColor(red: 0.90, green: 0.0, blue: 0.0, alpha: 1.0)
        let GREEN = UIColor(red: 0.0, green: 0.90, blue: 0.0, alpha: 1.0)
        
        federalTaxLabel.textColor  = RED
        netEarnedLabel.textColor   = GREEN
        ssTaxLabel.textColor       = RED
        medicareTaxLabel.textColor = RED
        
        
        // Perform calculations every second
        NSTimer.scheduledTimerWithTimeInterval(1.00, target: self, selector: Selector("main"), userInfo: nil, repeats: true)
    }

    // MARK: Variables
    // From Home View
    var HOURLY_WAGE:Double!
    var FEDERAL_TAX:Double!
    // Statics
    var SOCIAL_SECURITY:Double   = 0.0620
    var MEDICARE:Double          = 0.0145
    // Wage
    var totalEarned:Double   = 0.0
    var netEarned:Double     = 0.0
    // Tax
    var taxedFederal:Double  = 0.0
    var taxedSS:Double       = 0.0
    var taxedMedicare:Double = 0.0
    // Time
    var seconds:Int = 0
    var minutes:Int = 0
    var hours:Int   = 0
    
    // MARK: Functions
    func main() {
        // Handle elapsed time
        seconds++;
        if (seconds == 60) {
            seconds = 0;
            minutes++;
        }
        if (minutes == 60) {
            minutes = 0;
            hours++;
        }
        
        elapsedTime.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        
        // Handle wage and tax calculations (not very object oriented friendly yet..)
        calcWagePerSecond()
        calcFederalTax()
        calcSocialSecurity()
        calcMedicare()
        
        // Calculate total taxed wage
        let totalTaxed = taxedFederal + taxedSS + taxedMedicare
        
        // Update net wage
        netEarned = totalEarned - totalTaxed
        netEarnedLabel.text = String(format: "$%.2f", netEarned)
    }
    
    func calcWagePerSecond() {        
        totalEarned = totalEarned + (HOURLY_WAGE / (60 * 60))
        totalEarnedLabel.text = totalEarned.formatDouble
    }
    
    func calcFederalTax() {
        taxedFederal = totalEarned * FEDERAL_TAX
        federalTaxLabel.text = taxedFederal.formatDouble
    }
    
    func calcSocialSecurity() {
        taxedSS = totalEarned * SOCIAL_SECURITY
        ssTaxLabel.text = taxedSS.formatDouble
    }
    
    func calcMedicare() {
        taxedMedicare = totalEarned * MEDICARE
        medicareTaxLabel.text = taxedMedicare.formatDouble
    }
}

// MARK: Extensions
extension Double {
    var formatDouble: String {
        return String(format:"$%.2f", self)
    }
}

