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
    
    func getSmartContract() {}
    
    func setSmartContract(req: Request, smartContract: SmartContract) throws -> SmartContract {
        var smartContract = try req.content.syncDecode(SmartContract.self)
        
        return smartContract
    }
}
