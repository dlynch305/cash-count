//
//  ViewController.swift
//  cashcount
//
//  Created by Dylan Lynch on 12/2/15.
//  Copyright © 2015 Dylan Lynch. All rights reserved.
//

import UIKit

class CountViewController: UIViewController {
    
    // MARK: Variables
    var HOURLY_WAGE:Double!
    var FEDERAL_TAX:Double!
    var SOCIAL_SECURITY:Double   = 0.0620
    var MEDICARE:Double          = 0.0145
    
    var totalWageEarned:Double   = 0.0
    var netWageEarned:Double     = 0.0
    var wageTaxedFederal:Double  = 0.0
    var wageTaxedSS:Double       = 0.0
    var wageTaxedMedicare:Double = 0.0
    
    // MARK: Properties
    @IBOutlet var totalEarnedLabel: UILabel!
    @IBOutlet var federalTaxLabel: UILabel!
    @IBOutlet var netEarnedLabel: UILabel!
    
    @IBOutlet var socialSecurityLabel: UILabel!
    @IBOutlet var medicareLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let RED   = UIColor(red: 0.85, green: 0.0, blue: 0.0, alpha: 1.0)
        let GREEN = UIColor(red: 0.0, green: 0.85, blue: 0.0, alpha: 1.0)
        
        federalTaxLabel.textColor     = RED
        netEarnedLabel.textColor      = GREEN
        socialSecurityLabel.textColor = RED
        medicareLabel.textColor       = RED
        
        NSTimer.scheduledTimerWithTimeInterval(1.25, target: self, selector: Selector("main"), userInfo: nil, repeats: true)
    }

    // MARK: Functions
    func main() {
        calcWagePerSecond()
        calcFederalTax()
        calcSocialSecurity()
        calcMedicare()
        
        let totalWageTaxed = wageTaxedFederal + wageTaxedSS + wageTaxedMedicare
        
        netWageEarned = totalWageEarned - totalWageTaxed
        netEarnedLabel.text = String(format: "$%.2f", netWageEarned)
    }
    
    func calcWagePerSecond() {        
        totalWageEarned = totalWageEarned + (HOURLY_WAGE / (60 * 60))
        totalEarnedLabel.text = totalWageEarned.formatDouble
    }
    
    func calcFederalTax() {
        wageTaxedFederal = totalWageEarned * FEDERAL_TAX
        federalTaxLabel.text = wageTaxedFederal.formatDouble
    }
    
    func calcSocialSecurity() {
        wageTaxedSS = totalWageEarned * SOCIAL_SECURITY
        socialSecurityLabel.text = wageTaxedSS.formatDouble
    }
    
    func calcMedicare() {
        wageTaxedMedicare = totalWageEarned * MEDICARE
        medicareLabel.text = wageTaxedMedicare.formatDouble
    }
}

// MARK: Extensions
extension Double {
    var formatDouble: String {
        return String(format:"$%.2f", self)
    }
}

