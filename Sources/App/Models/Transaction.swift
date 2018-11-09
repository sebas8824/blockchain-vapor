//
//  Transaction.swift
//  App
//
//  Created by Sebastian on 11/8/18.
//

import Foundation
import Vapor

final class Transaction: Content {
    var from : String
    var to : String
    var amount : Double
    var hasTax: Bool
    
    init(from: String, to: String, amount: Double, hasTax: Bool) {
        self.from = from
        self.to = to
        self.amount = amount
        self.hasTax = hasTax
    }
}
