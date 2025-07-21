# Solidity-
UserProfile Smart Contract

The UserProfile smart contract is a simple Ethereum-based solution for managing user profiles. It allows users to register, update, and view their profile details on the blockchain.

Features

• User Registration: Users can register their profiles with a name, age, and email.

• Profile Update: Registered users can update their profile details.

• Profile Retrieval: Users can view their profile information, including their registration timestamp.

Prerequisites

To interact with this smart contract, you will need the following:

• An Ethereum wallet (e.g., MetaMask)

• Access to an Ethereum-compatible development environment, such as Remix or Hardhat

• A basic understanding of Solidity and Ethereum smart contract development

Smart Contract Details

Contract: `UserProfile`

Solidity Version

The contract is written in Solidity version ^0.8.0.

License

This contract is licensed under the MIT license.

Functions

1. `register(string memory _name, uint _age, string memory _email)`

Registers a new user with the given name, age, and email.

• Parameters:

• _name: The name of the user (string)

• _age: The age of the user (uint)

• _email: The email of the user (string)

• Requirements:

• The user must not already be registered.

• Description:

• Stores the user’s details into the blockchain along with the registration timestamp.

2. `updateProfile(string memory _name, uint _age, string memory _email)`

Allows a registered user to update their profile details.

• Parameters:

• _name: The updated name of the user (string)

• _age: The updated age of the user (uint)

• _email: The updated email of the user (string)

• Requirements:

• The user must already be registered.

3. `getProfile() public view returns (string memory name, uint age, string memory email, uint registrationTime)`

Retrieves the profile details of the calling user.

• Returns:

• name: The name of the user (string)

• age: The age of the user (uint)

• email: The email of the user (string)

• registrationTime: The timestamp when the user registered (uint)

• Requirements:

• The user must already be registered.

Data Structures

1. `struct User`

Defines the structure for user information:

• name: User’s name (string)

• age: User’s age (uint)

• email: User’s email (string)

• registrationTime: Timestamp of user registration (uint256)

• isRegistered: Whether the user is registered (bool)

2. `mapping(address => User) private users`

Maps Ethereum addresses to User structs, storing user profiles.

Deployment

To deploy this contract:

1. Copy the code into your Solidity IDE (e.g., Remix).

2. Compile the contract using Solidity version ^0.8.0.

3. Deploy the contract to your desired Ethereum network.

Usage

1. Register a User:Call the register function with your name, age, and email.

2. Update a Profile:Call the updateProfile function with updated details.

3. Retrieve Profile Information:Call the getProfile function to view your profile details.

Security Considerations

• Only the owner of an account can register, update, or retrieve their profile.

• The contract does not perform extensive validation on inputs (e.g., email format or age range).

License

This project is licensed under the MIT License. See the LICENSE file for details.
