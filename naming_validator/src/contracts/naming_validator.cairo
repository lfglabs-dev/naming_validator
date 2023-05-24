#[contract]
mod NamingValidator {

    // Dispatchers
    use naming_validator::interfaces::naming::NamingDispatcher;
    use naming_validator::interfaces::naming::NamingDispatcherTrait;
    use starknet::ContractAddress;
    use traits::Into;
    
    struct Storage {
        naming_contract: ContractAddress,
    }

    #[external]
    fn initializer(naming_contract: ContractAddress) {
        if naming_contract::read().into() == 0 {
            naming_contract::write(naming_contract);
        }
    }

    #[view]
    fn assert_domain_to_address(domain: Array<felt252>, address: felt252) {
        let expected_address = NamingDispatcher{
            contract_address: naming_contract::read()
        }.domain_to_address(domain);
        assert(expected_address == address, 'unexpected domain target');
    }

}
