import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let blockchainController = BlockchainController()
    router.get("/api/greet/", use: blockchainController.greet)
    router.get("/api/blockchain", use: blockchainController.getBlockchain)
}
