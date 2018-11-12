import Vapor

public func routes(_ router: Router) throws {
    try router.register(collection: BlockchainRouteCollection())
    try router.register(collection: SmartContractsRouteCollection())
}
