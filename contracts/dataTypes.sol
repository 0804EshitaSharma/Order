// SPDX-License-Identifier: MIT
// The line above is recommended and let you define the license of your contract
// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
import "hardhat/console.sol";
pragma solidity ^0.8.17;


// This is the main building block for smart contracts.
contract Simple {
    // Some string type variables to identify the token.
    // The `public` modifier makes a variable readable from outside the contract.
// bool  x;
uint x;
// uint[] private x;
// address x;
// bytes32 x;
// bytes x;
// string x;
// mapping(uint => address) names;
// struct Person{
// bool  x;
// uint x;
// uint[10] x;
//uint[] a = new uint[](8)


// }
// enum  Color
// {
// RED, GREEN, BLUE
// }

//functions
//read only functions "view" or "pure"
//external can be called from outside the smart contract and cannot be called from within the contract.like inside any function.
function getValue2() external view returns (uint){
    return x;
}
function getValue() public view returns (uint){
    return x;
}
//private 
function _getValue() private view returns (uint){
    return x;
}
//internal can be called frominherited classes
function _getValue1() internal view returns (uint){
    return x;
}
//set value
function setValue(uint _x)external{
    x=_x;
}
//msg
// msg.value
// msg.sender
// tx.origin
// block.timestamp

//control statements
function foo() external {
//     if(msg.sender == 100 && block.timestamp>123456){

//     }else{

//     }
// }
// for(uint i=0;i<10;i++){


// }

//  while(uint x){
// break;
// continue;
//  }

//storage arrays
//memory arrays // tempoarsy array 

}

uint[] myArray;
function pushElement(uint x) external {
    myArray.push(4);
    myArray[1]=10000
    //delete myArray[1]; reset the value to zero
    for(uint i=0;i<myArray.length;i++){

myArray[i];
}

}
//memory array not saved data with this
function pushElement1(uint x) external {
    uint[]  memory myArrayMemory = new uint[](10);
   // myArray.push(4); not allowed
    //myArray[1]=10000 allowed
    //delete myArray[1]; reset the value to zero
    for(uint i=0;i<myArray.length;i++){

myArray[i];
}

//with external we need to have calldata
function z(uint[] calldata name) external{
    
}
//with public,internal we need to have calldata
function z(uint[] memory name) public returns (uint[] memory){
    
}

mapping(uint =>address) balances;
mapping(address =>mapping(address => bool)) approved;
mapping(address =>uint[]) scores;
function foo(address s) external{
    balances[msg.sender]=100;
    balances[msg.sender];
    delete balances[msg.sender][s];
    scores[msg.sender].push(4);
     scores[msg.sender][4];
      scores[msg.sender][4]=10;
      delete scores[msg.sender][4];
}

struct User{
    string name;
    uint score;
    address add;
}
function foo(string callata _name) external{
User memory user1 = User(_name,0,msg.sender) ;
user1.name;
user1.score=100;
delete user1;
}
User[] users;
mapping(address => User) userList;
userList[msg.sender]=User();
enum STATE{INACTIVE , ACTIVE}
STATE state;

function setActive() external{
    state= STATE.ACTIVE;
}
struct User{
    string name;
}
User[] users;
function foo() external{
    // will be destroyed after the function
User memory user = users[0];
// will be there
User storage user = users[0];
user.name='ndkefnk';
}
function getName(User memory user ) internal{

}
function getName1(User[] calldata user ) external{

}
event NewTrade(uint indexed  date, address indexed from, address indexed  to, uint amount);

function trade( address to, uint amount) external {
emit NewTrade(now, msg.sender, to, amount);
}
mapping(address=>uint) balances;
function invest() external payable{
    if(msg.value < 1 ether){
revert();
    }
    balances[msg.sender] += msg.value;
}
address payable[] recipients;
function sendEther(address payable recipient) external{
    recipient.transfer(1 ether);
}

if(a>1000000){
    revert('This is the reason');
}
require(a>100000,'tghtjgntkmt');

function x() external myModifier() myModifier1(){

}

//Modifiers
modifier myModifier(){
 require(a>100000,'tghtjgntkmt');
 _;   
}


function x1() external myModifier(10){
    
}

//Modifiers
modifier myModifier1(uint a){
 require(a>100000,'tghtjgntkmt');
 _;   
}

//Modifiers
modifier onlyAdmin (){
 require(msg.sender==admin,'tghtjgntkmt');
 _;   
}

// Inheritance 
contract Feline {
function utterance() 
public returns (bytes32);

 } 
contract Cat is Feline {
function utterance()
public returns (bytes32) { return "meow";
} 
}
Function visibilities
● external: function can only be called from outside contract.
Arguments read from calldata
● public:  function can be called externally and internally. 
Arguments copied from calldata to memory
● private:  only visible inside contract
● internal: only visible in this contract and contracts deriving from it 
● view:  only read storage  (no writes to storage) 
● pure:  does not touch storage 
Calldatais a read-only byte array.
Memory is a byte array.
●Complex types (anything > 32 bytes such as structs, arrays, and strings) must be stored in memory or in storage.
string memoryname= “Alice”;
●Memory is cheap, but the cost of memory grows quadratically. 
mappings and state variables are always in storage.
}

   function setValue(uint256 _x) public {
        x = _x;
    }