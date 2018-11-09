# Blockchain Vapor
A Blockchain API built in Vapor 3

This API registers simple transactions and adds a tax if required.

## GET

- **/api/blockchain**: It is used for getting the whole blockchain of transactions

- **/api/blockchain/nodes**: Shows all of the registered nodes that listen to the blockchain

- **/api/blockchain/resolve**: If one of the registered nodes are not updated, this endpoint will allow to obtain the longest blockchain.


## POST

- **/api/blockchain/mine**: Registers transactions under this structure `'{ "from": "Sender", "to": "Reciever", "amount": 1000, "hasTax": true }'` where true or false vary the amount returned after adding the transaction to the chain.

- **/api/blockchain/nodes/register**: Register listening nodes by using this request body `'[{"address": "http://localhost:8080"},{"address": "http://localhost:8090"}]'`.
