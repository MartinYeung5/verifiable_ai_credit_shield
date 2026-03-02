use starknet::{ContractAddress, get_caller_address};
use starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess, Map, StorageMapReadAccess, StorageMapWriteAccess};

#[starknet::interface]
pub trait ICreditShield<TContractState> { 
    fn verify_credit_and_borrow(
        ref self: TContractState,
        proof: Array<felt252>,
        public_score: u128,
        amount: u256,
        collateral: u256
    ) -> bool;

    fn get_borrowed_amount(self: @TContractState, user: ContractAddress) -> u256;
}

#[starknet::contract]
mod CreditShield {
    use super::ICreditShield;  
    use starknet::{ContractAddress, get_caller_address};
    use starknet::storage::{Map, StorageMapReadAccess, StorageMapWriteAccess, StoragePointerReadAccess, StoragePointerWriteAccess};

    #[storage]
    struct Storage {
        borrowed: Map<ContractAddress, u256>,
        min_score: u128,
    }

    #[constructor]
    fn constructor(ref self: ContractState) {
        self.min_score.write(750);
    }

    fn compute_credit_score(income: u128, debt_ratio: u128, defaults: u128) -> u128 {
        let score = income * 8 - debt_ratio * 5 - defaults * 60;
        if score > 850 { 850 } else { score }
    }

    #[abi(embed_v0)]
    impl CreditShieldImpl of super::ICreditShield<ContractState> {  // 用 super::ICreditShield
        fn verify_credit_and_borrow(
            ref self: ContractState,
            proof: Array<felt252>,
            public_score: u128,
            amount: u256,
            collateral: u256
        ) -> bool {
            assert(proof.len() > 0, 'Invalid proof');
            assert(public_score >= self.min_score.read(), 'Credit score too low');

            let caller = get_caller_address();
            let current = self.borrowed.read(caller);
            let new_borrow = current + amount;

            self.borrowed.write(caller, new_borrow);
            true
        }

        fn get_borrowed_amount(self: @ContractState, user: ContractAddress) -> u256 {
            self.borrowed.read(user)
        }
    }
}