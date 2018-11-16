<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/36623515-7293b4ec-18d3-11e8-85ab-4e2f8fb38fbd.png" width="320" alt="API Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/api-template">
        <img src="https://circleci.com/gh/vapor/api-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.1-brightgreen.svg" alt="Swift 4.1">
    </a>
</p>

# Blockchain Vapor
A Blockchain API built in Vapor 3

This API registers simple transactions and adds a tax depending of the selected Smart Contract.

## Blockchain

- **GET: /api/blockchain**: It is used for getting the whole blockchain of transactions

- **GET: /api/blockchain/nodes**: Shows all of the registered nodes that listen to the blockchain

- **GET: /api/blockchain/resolve**: If one of the registered nodes are not updated, this endpoint will allow to obtain the longest blockchain.

- **POST: /api/blockchain/mine**: Registers transactions under this structure `'{ "from": "Sender", "to": "Reciever", "amount": 1000, "contractId": 1 }'` where contractId is the Smart Contract that will be used to calculate the tax for the transaction.

- **POST: /api/blockchain/nodes/register**: Register listening nodes by using this request body `'[{"proto": "http", "dns": "localhost", "port": "8080"},{"proto": "http", "dns": "localhost", "port": "8090"}]'`. Allowing each host to send their own transactions, sharing the same blockchain.

## Smart Contracts

- **GET: /api/smartcontracts**: Retrieves the list of smart contracts

- **GET: /api/smartcontracts/<contract_id>**: Retrieves the smart contract with a given identifier, otherwise, it will return an error message.

- **POST: /api/smartcontracts**: Registers a new contract by using this request body `{ "contractId": "example", "name": "Contract example", "tax": 0.2 }`.


## Next steps

- Synchronize correctly the blockchain resolution when two nodes have the same amount of transactions but both are different.
- Build a login route for the token generation
- Use the login generated token for each endpoint
- Build routes to update smart contracts using the PUT http method.

## Next level

- Dive deeper by implementing a digital signature model to encrypt the transactions. Should be bound to the user who is doing a transaction.
- Extend the smart contracts functionality according to the Ethereum specification.
