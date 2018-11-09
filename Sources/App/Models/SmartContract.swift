//
//  SmartContract.swift
//  App
//
//  Created by Sebastian on 11/9/18.
//

import Foundation
import Fluent
import FluentSQLite
import Vapor

final class SmartContract: Content, SQLiteModel, Migration {
    var id: Int?
    var contractId: String
    var name : String
    var tax : Float
    
    init(contractId: String, name: String, tax: Float) {
        self.contractId = contractId
        self.name = name
        self.tax = tax
    }
}
