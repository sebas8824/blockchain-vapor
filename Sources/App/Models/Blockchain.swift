/*
 
 Blockchain class: It is the class that has all the information of the transactions and nodes.
 
    blocks: Array of transactions (blocks)
    node: Array of nodes that listen to the transactions
 
 Created by Sebastian on 10/14/18.
 
 */

import Cocoa
import Vapor
import Crypto

final class Blockchain: Content {
    
    private (set) var blocks: [Block] = [Block]()    
    private (set) var nodes = [BlockchainNode]()
    
    init(genesisBlock: Block) {
        addBlock(genesisBlock)
    }
    
    func getBlockchain() -> [Block] {
        return self.blocks
    }
    
    func registerNodes(nodes: [BlockchainNode]) -> [BlockchainNode] {
        self.nodes.append(contentsOf: nodes)
        return self.nodes
    }
    
    func addBlock(_ block: Block) {
        if self.blocks.isEmpty {
            block.previousHash = String(repeating: "0", count: 10)
            block.hash = try? generateHash(for: block)
        }
        self.blocks.append(block)
    }
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = Block()
        transactions.forEach{
            transaction in
            block.addTransaction(transaction: transaction)
        }
        
        let previousBlock = getPreviousBlock()
        block.index = self.blocks.count
        block.previousHash = previousBlock.hash
        block.hash = try? generateHash(for: block)
        
        return block
    }
    
    private func getPreviousBlock() -> Block {
        return self.blocks[self.blocks.count-1]
    }
    
    /* This defines the complexity of the transaction hash */
    func generateHash(for block: Block) throws -> String  {
        var hash = try SHA1.hash(block.key).hexEncodedString()
        
        while(!hash.hasPrefix("00")) {
            block.nonce += 1
            hash = try SHA1.hash(block.key).hexEncodedString()
        }
        
        return hash
    }
}
