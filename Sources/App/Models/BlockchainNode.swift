//
//  BlockchainNode.swift
//  App
//
//  Created by Sebastian on 11/8/18.
//

import Foundation
import Vapor

final class BlockchainNode: Content {
    var address: String
    
    init(address: String) {
        self.address = address
    }
}
