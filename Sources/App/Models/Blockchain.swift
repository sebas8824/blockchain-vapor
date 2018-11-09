//
//  Models.swift
//  App
//
//  Created by Sebastian on 10/14/18.
//

import Cocoa
import Vapor

final class Blockchain: Content {
    
    private (set) var blocks: [Block] = [Block]()
    private (set) var nodes = [BlockchainNode]()
    
    init(genesisBlock: Block) {
        addBlock(genesisBlock)
    }
    
    func registerNodes(nodes: [BlockchainNode]) -> [BlockchainNode] {
        self.nodes.append(contentsOf: nodes)
        return self.nodes
    }
    
    func addBlock(_ block: Block) {
        /* This defines the Genesis block 0000000000 */
        if self.blocks.isEmpty {
            block.previousHash = String(repeating: "0", count: 10)
            block.hash = generateHash(for: block)
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
        block.hash = generateHash(for: block)
        
        return block
    }
    
    private func getPreviousBlock() -> Block {
        return self.blocks[self.blocks.count-1]
    }
    
    /* This defines the complexity of the transaction hash */
    func generateHash(for block: Block) -> String {
        var hash = block.key.sha1Hash()
        
        while(!hash.hasPrefix("0")) {
            block.nonce += 1
            hash = block.key.sha1Hash()
            print(hash)
        }
        
        return hash
    }
}

extension String {
    func sha1Hash() -> String {
        let task = Process()
        
        task.launchPath = "/usr/bin/shasum"
        task.arguments = []
        
        let inputPipe = Pipe()
        inputPipe.fileHandleForWriting.write(self.data(using: String.Encoding.utf8)!)
        inputPipe.fileHandleForWriting.closeFile()
        
        let outputPipe = Pipe()
        task.standardOutput = outputPipe
        task.standardInput = inputPipe
        task.launch()
        
        let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let hash = String(data: data, encoding: String.Encoding.utf8)!
        return hash.replacingOccurrences(of: "  -\n", with: "")
    }
}
