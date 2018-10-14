//
//  BlockchainService.swift
//  App
//
//  Created by Sebastian on 10/14/18.
//

import Foundation

class BlockchainService {
    private (set) var blockchain: Blockchain!
    
    init() {
        self.blockchain = Blockchain(genesisBlock: Block())
    }
    
    func getBlockchain() -> Blockchain {
        return self.blockchain
    }
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = self.blockchain.getNextBlock(transactions: transactions)
        self.blockchain.addBlock(block)
        return block
    }
}
