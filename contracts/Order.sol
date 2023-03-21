// SPDX-License-Identifier: MIT
// The line above is recommended and let you define the license of your contract
// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.17;

contract EthazonShop {


    struct EthazonOrder {
        bool isValidEthazonOrder;
        string customerName;
        string shippingAddress;
        bool hasConfirmed;
    }
    
    mapping(address => EthazonOrder) private orders;
    uint private constant orderPrice = 0.1 ether;
    uint private balance;

    modifier validOrder(address _customer) {
        require(bytes(orders[_customer].customerName).length > 0, "Customer name is empty");
        require(bytes(orders[_customer].shippingAddress).length > 0, "Shipping address is empty");
        require(orders[_customer].isValidEthazonOrder, "Order is NOT valid");
        require(!orders[_customer].hasConfirmed, "Order has already been confirmed");
        _;
    }
    
    modifier paidEnough {
        require(msg.value >= orderPrice, "Not enough Ether sent");
        _;
    }
    
    modifier checkValue(address _customer) {
        uint amountToRefund = msg.value - orderPrice;
        if(amountToRefund > 0) {
            payable(_customer).transfer(amountToRefund);
        }
        _;
    }

    function makeOrder(string memory _customerName, string memory _shippingAddress) public payable paidEnough checkValue(msg.sender) {
        require(bytes(_customerName).length > 0, "Customer name is empty");
        require(bytes(_shippingAddress).length > 0, "Shipping address is empty");
        require(!orders[msg.sender].isValidEthazonOrder || orders[msg.sender].hasConfirmed, "Customer has an active order");
        orders[msg.sender] = EthazonOrder(true, _customerName, _shippingAddress, false);
        balance += orderPrice;
    }
    
    function confirmOrder() public validOrder(msg.sender) {
        orders[msg.sender].hasConfirmed = true;
    }
    
    function cancelOrder() public validOrder(msg.sender) {
        uint amountToRefund = orderPrice;
        if(orders[msg.sender].hasConfirmed) {
            require(false, "Cannot cancel a confirmed order");
        }
        orders[msg.sender].isValidEthazonOrder = false;
        payable(msg.sender).transfer(amountToRefund);
        balance -= amountToRefund;
    }

    function getBalance() public view returns (uint) {
        return balance;
    }
    function getOrder(address customer) external view returns  (EthazonOrder memory){
       return orders[customer];
    }
     
}