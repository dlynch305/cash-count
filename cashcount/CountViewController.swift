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
    
    var wageEarned:Float = 0.0
    var wageTaxedFederal:Float = 0.0
//  var wageTaxedLocal:Float = 0.0
    
    // MARK: Properties
    @IBOutlet weak var earnedLabel: UILabel!
    @IBOutlet weak var federalTaxLabel: UILabel!
//    @IBOutlet weak var localTaxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var RED = UIColor(red: 0.85, green: 0.0, blue: 0.0, alpha: 1.0)
        var GREEN = UIColor(red: 0.0, green: 0.85, blue: 0.0, alpha: 1.0)
        
        earnedLabel.textColor = GREEN
        earnedLabel.text = String(format: "$%.2f", wageEarned)
        
        federalTaxLabel.textColor = RED
        federalTaxLabel.text = String(format: "$%.2f", wageTaxedFederal)
        
//        localTaxLabel.textColor = RED
//        localTaxLabel.text = String(format: "%.2f", wageTaxedLocal)

        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("calcMain"), userInfo: nil, repeats: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Functions
    func calcMain() {
        calcWagePerSecond()
        calcFederalTaxPerSecond()
        
    }
    
    func calcWagePerSecond() {        
        wageEarned = wageEarned + HOURLY_WAGE / (60 * 60)
        earnedLabel.text = String(format: "$%.2f", wageEarned)
    }
    
    func calcFederalTaxPerSecond() {
        wageTaxedFederal = wageEarned * FEDERAL_TAX
        federalTaxLabel.text = String(format: "$%.2f", wageTaxedFederal)
    }
}


