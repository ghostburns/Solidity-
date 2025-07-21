// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserProfile {
    struct User {
        string name;
        uint age;
        string email;
        uint256 registrationTime;
        bool isRegistered;
    }

    mapping(address => User) private users;

    /// @notice Registers a new user with profile details
    function register(string memory _name, uint _age, string memory _email) public {
        require(!users[msg.sender].isRegistered, "User already registered");

        users[msg.sender] = User({
            name: _name,
            age: _age,
            email: _email,
            registrationTime: block.timestamp,
            isRegistered: true
        });
    }

    /// @notice Updates the profile of an already registered user
    function updateProfile(string memory _name, uint _age, string memory _email) public {
        require(users[msg.sender].isRegistered, "User not registered");

        User storage user = users[msg.sender];
        user.name = _name;
        user.age = _age;
        user.email = _email;
    }

    /// @notice Returns the profile of the calling user
    function getProfile() public view returns (
        string memory name,
        uint age,
        string memory email,
        uint registrationTime
    ) {
        require(users[msg.sender].isRegistered, "User not registered");

        User memory user = users[msg.sender];
        return (user.name, user.age, user.email, user.registrationTime);
    }
}
