// const { expect } = require("chai");

// describe("EthazonShop", function () {
//   let EthazonShop;
//   let ethazonShop;
//   let owner;
//   let addr1;
//   let addr2;

//   beforeEach(async function () {
//     EthazonShop = await ethers.getContractFactory("EthazonShop");
//     [owner, addr1, addr2] = await ethers.getSigners();
//     ethazonShop = await EthazonShop.deploy();
//   });

//   it("should make an order", async function () {
//     await ethazonShop.connect(addr1).makeOrder("Alice", "123 Main St.", { value: ethers.utils.parseEther("0.1") });
//     const order = await ethazonShop.getOrder(addr1.address);

//     expect(order.isValidEthazonOrder).to.equal(true);
//     expect(order.customerName).to.equal("Alice");
//     expect(order.shippingAddress).to.equal("123 Main St.");
//     expect(order.hasConfirmed).to.equal(false);
//   });

//   it("should confirm an order", async function () {
//     await ethazonShop.connect(addr1).makeOrder("Alice", "123 Main St.", { value: ethers.utils.parseEther("0.1") });
//     await ethazonShop.connect(addr1).confirmOrder();
//     const order = await ethazonShop.getOrder(addr1.address);

//     expect(order.hasConfirmed).to.equal(true);
//   });

//   it("should cancel an order", async function () {
//     await ethazonShop.connect(addr1).makeOrder("Alice", "123 Main St.", { value: ethers.utils.parseEther("0.1") });
//     await ethazonShop.connect(addr1).cancelOrder();
//     const order = await ethazonShop.getOrder(addr1.address);

//     expect(order.isValidEthazonOrder).to.equal(false);
//     expect(await owner.getBalance()).to.equal(ethers.utils.parseEther("0.1"));
//     expect(await ethazonShop.getBalance()).to.equal(0);
//   });

//   it("should not cancel a confirmed order", async function () {
//     await ethazonShop.connect(addr1).makeOrder("Alice", "123 Main St.", { value: ethers.utils.parseEther("0.1") });
//     await ethazonShop.connect(addr1).confirmOrder();
//     const order = await ethazonShop.getOrder(addr1.address);
//     expect(order.hasConfirmed).to.equal(true);
//    await expect(ethazonShop.connect(addr1).cancelOrder()).to.be.revertedWith("Cannot cancel a confirmed order");
//   });

//   it("should not allow a customer to have multiple active orders", async function () {
//     await ethazonShop.connect(addr1).makeOrder("Alice", "123 Main St.", { value: ethers.utils.parseEther("0.1") });

//     await expect(ethazonShop.connect(addr1).makeOrder("Bob", "456 High St.", { value: ethers.utils.parseEther("0.1") })).to.be.revertedWith("Customer has an active order");
//   });

//   it("should not allow an empty customer name", async function () {
//     await expect(ethazonShop.connect(addr1).makeOrder("", "123 Main St.", { value: ethers.utils.parseEther("0.1") })).to.be.revertedWith("Customer name is empty");
//   });
// });