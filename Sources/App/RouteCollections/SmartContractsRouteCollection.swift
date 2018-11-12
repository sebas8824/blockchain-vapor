//
//  SmartContractsRouteCollection.swift
//  App
//
//  Created by Sebastian on 11/12/18.
//

import Foundation
import Vapor

final class SmartContractsRouteCollection: RouteCollection {
    let smartContractsController = SmartContractsController()
    
    func boot(router: Router) throws  {
        let smartContracts = router.grouped("api", "smartcontracts")
        
        smartContracts.get(use: smartContractsController.getSmartContracts)
        smartContracts.get(Int.parameter, use: smartContractsController.getSmartContract)
        smartContracts.post(SmartContract.self, use: smartContractsController.setSmartContract)
    }
}
