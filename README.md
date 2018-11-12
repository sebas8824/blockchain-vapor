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

This API registers simple transactions and adds a tax if required.

## GET

- **/api/blockchain**: It is used for getting the whole blockchain of transactions

- **/api/blockchain/nodes**: Shows all of the registered nodes that listen to the blockchain

- **/api/blockchain/resolve**: If one of the registered nodes are not updated, this endpoint will allow to obtain the longest blockchain.


## POST

- **/api/blockchain/mine**: Registers transactions under this structure `'{ "from": "Sender", "to": "Reciever", "amount": 1000, "contractId": 1 }'` where contractId is the Smart Contract that will be used to calculate the tax for the transaction.

- **/api/blockchain/nodes/register**: Register listening nodes by using this request body `'[{"address": "http://localhost:8080"},{"address": "http://localhost:8090"}]'`.


## Next steps

- Synchronize correctly the blockchain resolution when two nodes have the same amount of transactions but both are different.
- Add an authentication method for each endpoint
- The transactions will send the smart contract and will perform the specified operation.

## Next level

- Dive deeper by implementing a digital signature model to encrypt the transactions. Should be bound to the user who is doing a transaction.
- Extend the smart contracts functionality according to the Ethereum specification.
