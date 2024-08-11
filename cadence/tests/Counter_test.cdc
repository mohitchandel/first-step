import Test

access(all) let account = Test.createAccount()

access(all) fun testContract() {
    let err = Test.deployContract(
        name: "createList",
        path: "../contracts/createList.cdc",
        arguments: [],
    )

    Test.expect(err, Test.beNil())
}