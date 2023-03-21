const { expect } = require("chai");

describe("EthazonShop", function () {
  let owner;
  let ethazonShop;
  let hardhatEthazonShop;
  let person1;
  let person2;

  beforeEach(async () => {
    //creating contract's instance
    ethazonShop = await ethers.getContractFactory("EthazonShop");
    //ACCOUNTS ARE ACCESSIBLE
    //console.log("Signers object: ",owner);
    [owner, person1, person2] = await ethers.getSigners();
    //constructor argument
    hardhatEthazonShop = await ethazonShop.deploy();
  });

  describe("Deployment", function () {
    it("A customer cannot make the order if either the customerName or shippingAddress is empty", async function () {
      expect(
        await hardhatEthazonShop.makeOrder("Rohan Sohali", " ", {
          value: ethers.utils.parseEther("0.1"),
        })
      ).to.be.revertedWith("Shipping address is empty");
      expect(
        await hardhatEthazonShop
          .connect(person2)
          .makeOrder(" ", "xyzzz", { value: ethers.utils.parseEther("0.1") })
      ).to.be.revertedWith("Customer name is empty");
    });

    it("A customer cannot confirm if the order is not valid (when isValidEthazonOrder is false", async function () {
      await hardhatEthazonShop
        .connect(person1)
        .makeOrder("Rohan Sohali", " xyzzz", {
          value: ethers.utils.parseEther("0.1"),
        });
      const order = await hardhatEthazonShop.getOrder(person1.address);
      order.isValidEthazonOrder = false;
      expect(
        await hardhatEthazonShop.connect(person1).confirmOrder()
      ).to.be.revertedWith("Order is NOT valid");
    });

    it("A customer can confirm the order if everything is good.", async function () {
      await hardhatEthazonShop.connect(person1)
      .makeOrder("Rohan Sohali", " xyzzz", {
        value: ethers.utils.parseEther("0.1"),
      });
      await hardhatEthazonShop.connect(person1).confirmOrder();
      const order = await hardhatEthazonShop.getOrder(person1.address);
   
      expect(
       order.hasConfirmed
      ).to.equal(true);
    });
    it("A customer cannot make an order if he/she does not send enough ether to the smart contract.", async function () {
      expect(
        await hardhatEthazonShop.connect(person2)
        .makeOrder("Rohan Sohali", " xyzzz", {
          value: ethers.utils.parseEther("0.01")
        })).to.be.revertedWith("Not enough Ether sent");
    });
  });
});
