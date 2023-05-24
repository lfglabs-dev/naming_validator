#[abi]
trait Naming {

    // returns the target of a domain
    fn domain_to_address(domain: Array<felt252>) -> felt252;

    // returns the main domain
    fn address_to_domain(address: starknet::ContractAddress) -> Array<felt252>;
}