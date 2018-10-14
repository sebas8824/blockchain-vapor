import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let blockchainController = BlockchainController()
    router.get("/api/blockchain", use: blockchainController.getBlockchain)
    router.post(Transaction.self, at: "/api/blockchain/mine", use: blockchainController.mine)
}
