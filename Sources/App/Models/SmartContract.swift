/*
 
 SmartContract class: Related to the operations that applies to the given transaction
 
    id: Unique identifier of the contract
    contractId: Brief and textual identifier of the contract
    name: Full name of the contract
    tax: Tax value for the contract
 
 Created by Sebastian on 11/9/18.
 
 */

import Foundation
import Fluent
import FluentSQLite
import Vapor

final class SmartContract: Content, SQLiteModel, Migration {
    var id: Int?
    var contractId: String
    var name : String
    var tax : Double
    
    init(contractId: String, name: String, tax: Double) {
        self.contractId = contractId
        self.name = name
        self.tax = tax
    }
}
