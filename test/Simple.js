// const { expect } = require("chai");

// describe("Simple contract", function () {
//   let owner;
//   let Simple;
//   let hardhatToken;
//   let person1;
//   let person2;
   
//   beforeEach(async () => {
//       //creating contract's instance
//     Simple = await ethers.getContractFactory("Simple");
//      //ACCOUNTS ARE ACCESSIBLE
//     //console.log("Signers object: ",owner);
//     [owner,person1,person2] = await ethers.getSigners();
//         //constructor argument
//     hardhatToken = await Simple.deploy();
//   });

//   describe("Deployment",function(){

//   it("Deployment should assign the total supply of tokens to the owner", async function () {
//     console.log("**********",await hardhatToken.value);
//     expect(await hardhatToken.getValue()).to.equal(10000);
//   });

//   it("should set the value", async function () {
//     hardhatToken.setValue(20000);
//     expect(await hardhatToken.getValue()).to.equal(20000);
//   });

//   });
// });