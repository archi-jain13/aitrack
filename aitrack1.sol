pragma solidity ^0.8.0;

contract ProofOfInteraction {
    struct Interaction {
        address user;
        uint256 timestamp;
    }

    Interaction[] public interactions;
    mapping(address => uint256) public lastInteraction;

    event InteractionLogged(address indexed user, uint256 timestamp);

    function logInteraction() public {
        interactions.push(Interaction(msg.sender, block.timestamp));
        lastInteraction[msg.sender] = block.timestamp;
        emit InteractionLogged(msg.sender, block.timestamp);
    }

    function getInteractionCount() public view returns (uint256) {
        return interactions.length;
    }
}
