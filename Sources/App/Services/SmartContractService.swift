//
//  SmartContractService.swift
//  App
//
//  Created by Sebastian on 11/8/18.
//

import Foundation

class SmartContractService {
    func addTax(tax: Double, amount: Double) -> Double {
        return amount + (amount * tax)
    }
}
