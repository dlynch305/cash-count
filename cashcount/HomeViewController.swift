//
//  ViewController.swift
//  cashcount
//
//  Created by Dylan Lynch on 12/2/15.
//  Copyright © 2015 Dylan Lynch. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet var hourlyWageField: UITextField!
    @IBOutlet var federalTaxField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hourlyWageField.delegate = self
        hourlyWageField.keyboardType = .DecimalPad
        
        federalTaxField.delegate = self
        federalTaxField.keyboardType = .DecimalPad
        
        // Respond to taps and dismiss the keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let countController = segue.destinationViewController as! CountViewController;
        
        countController.HOURLY_WAGE = hourlyWageField.text!.doubleValue
        countController.FEDERAL_TAX = federalTaxField.text!.doubleValue / 100
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide numeric keyboard
        hourlyWageField.resignFirstResponder()
        federalTaxField.resignFirstResponder()
        return true
    }
    
    // MARK: Functions
    func dismissKeyboard() {
        view.endEditing(true)
    }

    
}

// MARK: Extensions
extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}
