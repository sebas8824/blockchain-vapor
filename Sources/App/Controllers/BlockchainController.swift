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
    private (set) var smartContractService: SmartContractService
    
    init() {
        self.blockchainService = BlockchainService()
        self.smartContractService = SmartContractService()
    }

    func getBlockchain(req: Request) -> [Block] {
        return self.blockchainService.getBlockchain()
    }
    
    func mine(req: Request, transaction: Transaction) throws -> Future<Block> {
        return try smartContractService.getContractTaxById(transaction: transaction.contractId, req: req)
            .map(to: Block.self) { tx in
                transaction.amount = transaction.amount + (transaction.amount * tx)
                return self.blockchainService.getNextBlock(transactions: [transaction])
        }
    }
    
    func registerNodes(req: Request, nodes: [BlockchainNode]) -> [BlockchainNode] {
        return self.blockchainService.registerNodes(nodes: nodes)
    }
    
    func getNodes(req: Request) -> [BlockchainNode] {
        return self.blockchainService.getNodes()
    }
    
    func resolve(req: Request) -> Future<[Block]> {
        let promise: EventLoopPromise<[Block]> = req.eventLoop.newPromise()
        blockchainService.resolve {
            promise.succeed(result: $0)
        }
        
        return promise.futureResult
    }
}
