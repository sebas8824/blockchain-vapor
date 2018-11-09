//
//  Block.swift
//  App
//
//  Created by Sebastian on 11/8/18.
//

/*

 Block class: It is the container of the transaction that will be chained to other blocks with its hashes
 
 index: Transaction index
 previousHash: Hash of the previous transaction
 hash: Hash of the current transaction
 nonce: Unique and arbitraty number of the current transaction

 */


import Foundation
import Vapor

final class Block: Content {
    var index : Int = 0
    var previousHash : String = ""
    var hash : String!
    var nonce : Int
    
    private (set) var transactions: [Transaction] = [Transaction]()
        
    init() {
        self.nonce = 0
    }
    
    /* This is the transaction key */
    var key: String {
        get {
            let transactionsData = try! JSONEncoder().encode(self.transactions)
            let transactionsJSONString = String(data: transactionsData, encoding: .utf8)
            return String(self.index) + self.previousHash + String(self.nonce) + transactionsJSONString!
        }
    }
    
    func addTransaction(transaction: Transaction) {
        self.transactions.append(transaction)
    }
}
