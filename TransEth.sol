//SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.13; 
contract MyFirstContract{
       uint public oneWei = 1 wei;
    // 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;
    uint public oneGwei = 2300 wei;
    uint public OneEther = 1000000000000000000 wei;
    uint public Ether = 1000000000 gwei;

    uint public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;
    // Several ways to initialize an array
    uint[] public arr;
    uint[] public arr2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
    // Fixed sized array, all elements initialize to 0
    uint[50000] public myFixedSizeArr;
    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function get(uint i) public view returns (uint) {
        return arr[i];
    }
function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
    // Solidity can return the entire array.
    // But this function should be avoided for
    // arrays that can grow indefinitely in length.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }
    function addresses() public {    
        
    }
 
    
    function getBalance() public view returns(uint) { return address(this).balance; }

        function send(address payable _To )public payable returns (bool)
    {
    _To.transfer(msg.value);
    return true;
    }

}
