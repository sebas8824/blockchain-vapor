/*
 
 Transaction class: It is related to the transaction details.
 
    from: Sender of the transaction
    to: Reciever of the transaction
    amount: Amount of the transaction
    contractId: Smart contract used by the transaction
 
 Created by Sebastian on 11/8/18.
 
 */

import Foundation
import Vapor

final class Transaction: Content {
    var from : String
    var to : String
    var amount : Double
    var contractId: Int
    
    init(from: String, to: String, amount: Double, contractId: Int) {
        self.from = from
        self.to = to
        self.amount = amount
        self.contractId = contractId
    }
}
