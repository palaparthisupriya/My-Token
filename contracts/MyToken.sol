// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {

    // 🔐 Owner
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner allowed");
        _;
    }

    // 🔹 Token metadata
    string public name = "MyToken"; // [cite: 48, 236]
    string public symbol = "MTK";  // [cite: 48, 237]
    uint8 public decimals = 18;    // [cite: 48, 304, 316]

    // 🔹 Total supply
    uint256 public totalSupply;    // [cite: 49, 105]

    // 🔹 Balances & allowances
    mapping(address => uint256) public balanceOf; // [cite: 50, 107]
    mapping(address => mapping(address => uint256)) public allowance; // [cite: 109]

    // 🔹 ERC-20 Events
    event Transfer(address indexed from, address indexed to, uint256 value); // [cite: 54, 119]
    event Approval(address indexed owner, address indexed spender, uint256 value); // [cite: 54, 121]

    // 🔹 Constructor
    constructor(uint256 _initialSupply) { // [cite: 110, 307]
        owner = msg.sender;
        totalSupply = _initialSupply; // [cite: 111]
        balanceOf[msg.sender] = _initialSupply; // [cite: 49, 113]
        emit Transfer(address(0), msg.sender, _initialSupply); // [cite: 74, 122]
    }

    // 🔹 Transfer tokens
    function transfer(address _to, uint256 _value) public returns (bool) { // [cite: 51, 127]
        require(_to != address(0), "Transfer to zero address"); // [cite: 55, 131, 299]
        require(balanceOf[msg.sender] >= _value, "Insufficient balance"); // [cite: 55, 136, 301]

        balanceOf[msg.sender] -= _value; // [cite: 139]
        balanceOf[_to] += _value; // [cite: 141]

        emit Transfer(msg.sender, _to, _value); // [cite: 54, 146]
        return true; // [cite: 306]
    }

    // 🔹 Approve allowance
    function approve(address _spender, uint256 _value) public returns (bool) { // [cite: 53, 157]
        require(_spender != address(0), "Approve to zero address"); // [cite: 161]

        allowance[msg.sender][_spender] = _value; // [cite: 166]
        emit Approval(msg.sender, _spender, _value); // [cite: 54, 171]
        return true; // [cite: 174, 306]
    }

    // 🔹 Transfer using allowance
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) { // [cite: 53, 180]
        require(_from != address(0), "Transfer from zero address");
        require(_to != address(0), "Transfer to zero address"); // [cite: 184]
        require(balanceOf[_from] >= _value, "Insufficient balance"); // [cite: 189]
        require(allowance[_from][msg.sender] >= _value, "Allowance exceeded"); // [cite: 194]

        balanceOf[_from] -= _value; // [cite: 197]
        balanceOf[_to] += _value; // [cite: 199]
        allowance[_from][msg.sender] -= _value; // [cite: 201, 303]

        emit Transfer(_from, _to, _value); // [cite: 54, 206]
        return true; // [cite: 209, 306]
    }

    // 🔹 Mint tokens (owner only)
    function mint(address _to, uint256 _amount) public onlyOwner returns (bool) { // [cite: 323, 338]
        require(_to != address(0), "Mint to zero address");

        totalSupply += _amount;
        balanceOf[_to] += _amount;

        emit Transfer(address(0), _to, _amount);
        return true;
    }

    // 🔹 Burn tokens
    function burn(uint256 _amount) public returns (bool) { // [cite: 323, 338]
        require(balanceOf[msg.sender] >= _amount, "Not enough balance");

        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;

        emit Transfer(msg.sender, address(0), _amount);
        return true;
    }
}