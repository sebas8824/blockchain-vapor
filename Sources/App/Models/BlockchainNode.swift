//
//  BlockchainNode.swift
//  App
//
//  Created by Sebastian on 11/8/18.
//

import Foundation
import Vapor

final class BlockchainNode: Content {
    var proto: String
    var dns: String
    var port: String
    
    init(proto: String, dns: String, port: String) {
        self.proto = proto
        self.dns = dns
        self.port = port
    }
    
    var address: String {
        get {
            return String(self.proto) + "://" + self.dns + ":" + String(self.port)
        }
    }
}
