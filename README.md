# Error-Handler in Smart Contract


An error handler is a mechanism in software development that deals with errors or exceptions that may occur during the execution of a program. Errors can happen for various reasons, such as incorrect user input, hardware failures, or unexpected conditions in the program.

The primary purpose of an error handler is to gracefully manage these errors, preventing them from causing the entire program to crash or behave unpredictably. Instead, the error handler allows the program to respond to errors in a controlled manner, often by providing meaningful error messages, logging relevant information for debugging, and potentially taking corrective actions.

## Contract Structure:  Escrow Contract


### buyer, seller, arbiter: 

Addresses representing the buyer, seller, and a third-party arbiter. amount: The amount of ether involved in the transaction.

### buyerConfirmed, sellerConfirmed: 

Booleans indicating whether the buyer and seller have confirmed the transaction.

### currentState: 

An enumeration named State representing the current state of the escrow contract. It has states such as Initialized, BuyerPaid, SellerConfirmed, Completed, and Cancelled.

### Modifiers:
        
#### onlyBuyer: 

Restricts the execution of a function to only the buyer.

#### onlySeller:

 Restricts the execution of a function to only the seller.

#### inState: 

Ensures that a function can only be called in a specific state.

### Events:
        
#### FundsDeposited: 

Emitted when the buyer deposits funds into the escrow.
        
#### BuyerConfirmed:

 Emitted when the buyer confirms receipt.

#### SellerConfirmed: 

Emitted when the seller confirms delivery.
        
#### FundsReleased:

 Emitted when funds are released, indicating that the transaction is either completed or canceled.

### Constructor:

Initializes the contract with the buyer's address, seller's address, and arbiter's address. The initial state is set to Initialized.

### Functions:
        
#### depositFunds:

Allows the buyer to deposit funds into the escrow. It transitions the state to BuyerPaid.
        
#### confirmReceipt:

Allows the buyer to confirm the receipt of the item. If both buyer and seller have confirmed, the funds are released to the seller, and the state becomes Completed.

#### confirmDelivery:

Allows the seller to confirm the delivery of the item. If both buyer and seller have confirmed, the funds are released to the seller, and the state becomes Completed.

#### cancelTransaction:

Allows the arbiter to cancel the transaction, returning funds to the buyer. The state becomes Cancelled.

### Fallback Function:

A fallback function is implemented to reject any direct payments sent to the contract.

This contract is designed to facilitate a simple escrow transaction where the buyer deposits funds, confirms receipt, the seller confirms delivery, and an arbiter can cancel the transaction if needed. The contract aims to ensure a fair and secure exchange of goods or services.

### Conclusion:

The contract showcases best practices such as input validation, access control with modifiers, and the use of different error-handling mechanisms (`require, assert,` and `revert`).


## Authors
[@metacraftersio]()

[Oche Esther](https://twitter.com/Estheroche1)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.