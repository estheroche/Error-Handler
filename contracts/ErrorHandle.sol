// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public buyer;
    address public seller;
    address public arbiter; // A third-party to resolve disputes if necessary
    uint public amount;
    bool public buyerConfirmed;
    bool public sellerConfirmed;

    enum State {
        Initialized,
        BuyerPaid,
        SellerConfirmed,
        Completed,
        Cancelled
    }
    State public currentState;

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only the buyer can call this function");
        _;
    }

    modifier onlySeller() {
        require(msg.sender == seller, "Only the seller can call this function");
        _;
    }

    modifier inState(State _state) {
        require(currentState == _state, "Invalid state");
        _;
    }

    event FundsDeposited(address indexed _depositor, uint _amount);
    event BuyerConfirmed();
    event SellerConfirmed();
    event FundsReleased();

    constructor(address _seller, address _arbiter) {
        buyer = msg.sender;
        seller = _seller;
        arbiter = _arbiter;
        currentState = State.Initialized;
    }

    function depositFunds()
        external
        payable
        onlyBuyer
        inState(State.Initialized)
    {
        amount = msg.value;
        currentState = State.BuyerPaid;
        emit FundsDeposited(msg.sender, msg.value);
    }

    function confirmReceipt() external onlyBuyer inState(State.BuyerPaid) {
        buyerConfirmed = true;
        emit BuyerConfirmed();

        // If both buyer and seller confirm, release funds
        if (sellerConfirmed) {
            currentState = State.Completed;
            emit FundsReleased();
            payable(seller).transfer(amount);
        }
    }

    function confirmDelivery() external onlySeller inState(State.BuyerPaid) {
        sellerConfirmed = true;
        emit SellerConfirmed();

        // If both buyer and seller confirm, release funds
        if (buyerConfirmed) {
            currentState = State.Completed;
            emit FundsReleased();
            payable(seller).transfer(amount);
        }
    }

    function cancelTransaction() external inState(State.BuyerPaid) {
        require(
            msg.sender == arbiter,
            "Only the arbiter can cancel the transaction"
        );
        currentState = State.Cancelled;
        emit FundsReleased();
        payable(buyer).transfer(amount);
    }

    // Fallback function to reject any ether sent to the contract
    receive() external payable {
        revert("This contract does not accept direct payments.");
    }
}
