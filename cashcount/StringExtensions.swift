//
//  StringExtensions.swift
//  cashcount
//
//  Created by Dylan Lynch on 12/2/15.
//  Copyright © 2015 Dylan Lynch. All rights reserved.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        return NSNumberFormatter().numberFromString(self)?.doubleValue
    }
}