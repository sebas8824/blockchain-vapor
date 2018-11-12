//
//  SmartContractsController.swift
//  App
//
//  Created by Sebastian on 11/9/18.
//

import Foundation
import Vapor

class SmartContractsController {
    private (set) var smartContractsService: SmartContractService
    
    init() {
        self.smartContractsService = SmartContractService()
    }
    
    func getSmartContracts(req: Request) throws -> Future<[SmartContract]> {
        return try self.smartContractsService.listSmartContracts(req: req)
    }
    
    func setSmartContract(req: Request, smartContract: SmartContract) throws -> Future<SmartContract> {
        return try self.smartContractsService.persistSmartContract(req: req, smartContract: smartContract)
    }
    
    func getSmartContract(req: Request) throws -> Future<SmartContract> {
        return try self.smartContractsService.getSmartContract(req: req)
    }
    
    func getContractTaxById(transaction: Int?, req: Request) throws -> Future<Double> {
        return try self.smartContractsService.getContractTaxById(transaction: transaction, req: req)
    }
}
