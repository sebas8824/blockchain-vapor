//
//  BlockchainController.swift
//  App
//
//  Created by Sebastian on 10/14/18.
//

import Foundation
import Vapor

class BlockchainController {
    
    private (set) var blockchainService: BlockchainService
    
    init() {
        self.blockchainService = BlockchainService()
    }
    
    /* Won't require of Future<Blockchain> because BlockchainService already takes care of
     returning the Blockchain **/
    func getBlockchain(req: Request) -> Blockchain {
        return self.blockchainService.getBlockchain()
    }
    
    func mine(req: Request, transaction: Transaction) -> Block {
        return self.blockchainService.getNextBlock(transactions: [transaction])
    }
}
