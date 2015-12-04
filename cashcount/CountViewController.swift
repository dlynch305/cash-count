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
    var HOURLY_WAGE:Float!
    var FEDERAL_TAX:Float!
    
    var totalWageEarned:Float!
    var netWageEarned:Float!
    var wageTaxedFederal:Float!
    
    // MARK: Properties
    @IBOutlet weak var totalEarnedLabel: UILabel!
    @IBOutlet weak var federalTaxLabel: UILabel!
    @IBOutlet weak var netEarnedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let RED = UIColor(red: 0.85, green: 0.0, blue: 0.0, alpha: 1.0)
        let GREEN = UIColor(red: 0.0, green: 0.85, blue: 0.0, alpha: 1.0)
        
        federalTaxLabel.textColor = RED
        netEarnedLabel.textColor = GREEN
        
        NSTimer.scheduledTimerWithTimeInterval(1.25, target: self, selector: Selector("main"), userInfo: nil, repeats: true)
    }

    // MARK: Functions
    func main() {
        calcWagePerSecond()
        calcFederalTax()
        
        netWageEarned = totalWageEarned - wageTaxedFederal
        netEarnedLabel.text = String(format: "$%.2f", netWageEarned)
    }
    
    func calcWagePerSecond() {        
        totalWageEarned = totalWageEarned + HOURLY_WAGE / (60 * 60)
        totalEarnedLabel.text = String(format: "$%.2f", totalWageEarned)
    }
    
    func calcFederalTax() {
        wageTaxedFederal = totalWageEarned * FEDERAL_TAX
        federalTaxLabel.text = String(format: "$%.2f", wageTaxedFederal)
    }
}


