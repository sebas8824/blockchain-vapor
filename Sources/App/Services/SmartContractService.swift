//
//  SmartContractService.swift
//  App
//
//  Created by Sebastian on 11/8/18.
//

import Foundation
import Vapor
import Fluent
import FluentSQLite

class SmartContractService {
    func addTax(tax: Double, amount: Double) -> Double {
        return amount + (amount * tax)
    }
    
    func persistSmartContract(req: Request, smartContract: SmartContract) throws -> Future<SmartContract> {
        return smartContract.save(on: req).flatMap(to: SmartContract.self) { contract in
            return try req.content.decode(SmartContract.self)
        }
    }
    
    func listSmartContracts(req: Request) throws -> Future<[SmartContract]> {
        return try SmartContract.query(on: req).all()
    }
    
    func getSmartContract(req: Request) throws -> Future<SmartContract> {
        let contractID = try req.parameters.next(Int.self)
        let query = try SmartContract.find(contractID, on: req)
        
        return query.map(to: SmartContract.self) { c in
            guard let contract = c else {
                throw Abort(.notFound)
            }
            return contract
        }
    }
}
