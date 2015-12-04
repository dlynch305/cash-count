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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hourlyWageField.delegate = self
        hourlyWageField.keyboardType = .DecimalPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let countController = segue.destinationViewController as! CountViewController;
        
        countController.HOURLY_WAGE = hourlyWageField.text!.floatValue
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide numeric keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
       // hourlyWage = hourlyWageField.text?.floatValue
    }
    
    // MARK: Actions

    
}

// MARK: Extensions
extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}