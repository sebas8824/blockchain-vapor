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
    
    func greet(req: Request) -> Future<String> {
        return Future.map(on: req) { () -> String in
            return "Welcome to blockchain";
        }
    }
}
