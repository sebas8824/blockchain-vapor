//
//  BlockchainRouteCollection.swift
//  App
//
//  Created by Sebastian on 11/12/18.
//

import Foundation
import Vapor

final class BlockchainRouteCollection: RouteCollection {
    let blockchainController = BlockchainController()
    
    func boot(router: Router) throws {
        let blockchain = router.grouped("api", "blockchain")
        
        blockchain.get(use: blockchainController.getBlockchain)
        blockchain.post(Transaction.self, at: "mine", use: blockchainController.mine)
        blockchain.post([BlockchainNode].self, at: "nodes/register", use: blockchainController.registerNodes)
        blockchain.get("nodes", use: blockchainController.getNodes)
        blockchain.get("resolve", use: blockchainController.resolve)
    }
}
