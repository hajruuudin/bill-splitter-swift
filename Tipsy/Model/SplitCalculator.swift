//
//  SplitCalculator.swift
//  Tipsy
//
//  Created by Hajrudin Imamovic on 02/02/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct SplitCalculator{
    var totalBill : Double?
    var tipPercentage : Double?
    var splitNumber : Int?
    var billEqualSplit : Double?
    
    mutating func calculateSplit() -> String {
        if totalBill != nil && tipPercentage != nil && splitNumber != nil{
            let tip = totalBill! * tipPercentage!
            let billWithTip = totalBill! + tip
            billEqualSplit = billWithTip / Double(splitNumber!)
        } else {
            billEqualSplit = 0.123
        }
        return String(format: "%.2f", billEqualSplit!)
    }
}

