// const { expect } = require("chai");

// describe("Token contract", function () {
//   let owner;
//   let Token;
//   let hardhatToken;
//   let person1;
//   let person2;
   
//   beforeEach(async () => {
//       //creating contract's instance
//     Token = await ethers.getContractFactory("Token");
//      //ACCOUNTS ARE ACCESSIBLE
//     //console.log("Signers object: ",owner);
//     [owner,person1,person2] = await ethers.getSigners();
//         //constructor argument
//     hardhatToken = await Token.deploy(owner.address);
//   });

//   describe("Deployment",function(){

//   it("Deployment should assign the total supply of tokens to the owner", async function () {
//     const ownerBalance = await hardhatToken.balanceOf(owner.address);
//     expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
//   });

//   it("should transfer the amount from sender to receiver", async function () {
//     //ACCOUNTS ARE ACCESSIBLE
//     // const [owner,person1,person2] = await ethers.getSigners();
//     //console.log("Signers object: ",owner);
//     const amount = 10;
//     //creating contract's instance
//     //const Token = await ethers.getContractFactory("Token");

//     //const hardhatToken = await Token.deploy(owner.address);

//     await hardhatToken.transfer(person1.address,amount);
//     expect(await hardhatToken.balanceOf(owner.address)).to.equal(90);
//     expect(await hardhatToken.balanceOf(person1.address)).to.equal(amount);
//     await hardhatToken.connect(person1).transfer(person2.address,5);
//     expect(await hardhatToken.balanceOf(person1.address)).to.equal(5);
//   });
//   });
// });