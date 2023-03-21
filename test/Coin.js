// const { expect } = require("chai");

// describe("Coin contract", function () {
//   let owner;
//   let Coin;
//   let hardhatCoin;
//   let person1;
//   let person2;
   
//   beforeEach(async () => {
//       //creating contract's instance
//     Coin = await ethers.getContractFactory("Coin");
//      //ACCOUNTS ARE ACCESSIBLE
//     //console.log("Signers object: ",owner);
//     [owner,person1,person2] = await ethers.getSigners();
//         //constructor argument
//     hardhatCoin = await Coin.deploy();
//   });

//   describe("Deployment",function(){
//     it("should revert the transaction if not done by the owner", async function () {
//         const amount = 10;
//         await expect(hardhatCoin.connect(person1).mint(person2.address,amount)).to.be.revertedWith("You are not the owner");
//       });

// //   it("should transfer the amount from sender to receiver", async function () {
// //     const amount = 10;
// //     const ownerBalance = await hardhatCoin.balanceOf(owner.address);
// //     const person1Balance = await hardhatCoin.balanceOf(person1.address);
// //     await hardhatCoin.mint(person1.address,amount);
// //    //expect(await ownerBalance).to.equal(ownerBalance-10);
// //     expect(await person1Balance).to.equal(10);
// //   });
//   });
// });