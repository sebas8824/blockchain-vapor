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
    //private (set) var smartContractService: SmartContractService
    
    init() {
        self.blockchainService = BlockchainService()
        //self.smartContractService = SmartContractService()
    }
    
    /* Won't require of Future<Blockchain> because BlockchainService already takes care of
     returning the Blockchain **/
    func getBlockchain(req: Request) -> Blockchain {
        return self.blockchainService.getBlockchain()
    }
    
    func mine(req: Request, transaction: Transaction) -> Block {
        /*if transaction.hasTax {
            transaction.amount = smartContractService.addTax(tax: 0.24, amount: transaction.amount)
        }*/
        return self.blockchainService.getNextBlock(transactions: [transaction])
    }
    
    func registerNodes(req: Request, nodes: [BlockchainNode]) -> [BlockchainNode] {
        return self.blockchainService.registerNodes(nodes: nodes)
    }
    
    func getNodes(req: Request) -> [BlockchainNode] {
        return self.blockchainService.getNodes()
    }
    
    func resolve(req: Request) -> Future<Blockchain> {
        let promise: EventLoopPromise<Blockchain> = req.eventLoop.newPromise()
        blockchainService.resolve {
            promise.succeed(result: $0)
        }
        
        return promise.futureResult
    }
}
