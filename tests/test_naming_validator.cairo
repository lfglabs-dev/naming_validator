use array::ArrayTrait;
use result::ResultTrait;

#[test]
fn test_increase_balance() {
    let contract_address = deploy_contract('naming_validator', @ArrayTrait::new()).unwrap();

    // initialization
    let mut invoke_calldata = ArrayTrait::new();
    invoke_calldata.append(0x06ac597f8116f886fa1c97a23fa4e08299975ecaf6b598873ca6792b9bbfb678);
    invoke(contract_address, 'initializer', @invoke_calldata).unwrap();

    // assertion
    let mut calldata = ArrayTrait::new();
    calldata.append(1);
    calldata.append(33133781693);
    calldata.append(0x00a00373A00352aa367058555149b573322910D54FCDf3a926E3E56D0dCb4b0c);
    //call(contract_address, 'assert_domain_to_address', @ArrayTrait::new()).unwrap();
}
