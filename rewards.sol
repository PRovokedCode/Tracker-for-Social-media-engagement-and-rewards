// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SocialMediaTracker {
    mapping(address => uint256) public engagementPoints;
    mapping(address => uint256) public rewards;

    function likePost() public {
        engagementPoints[msg.sender] += 1;
    }

    function sharePost() public {
        engagementPoints[msg.sender] += 2;
    }

    function commentPost() public {
        engagementPoints[msg.sender] += 3;
    }

    function claimReward() public {
        uint256 points = engagementPoints[msg.sender];
        require(points >= 10, "Not enough engagement points");

        rewards[msg.sender] += points / 10; // Reward for every 10 points
        engagementPoints[msg.sender] = 0; // Reset points after claim
    }

    function getEngagementPoints(address user) public view returns (uint256) {
        return engagementPoints[user];
    }

    function getRewards(address user) public view returns (uint256) {
        return rewards[user];
    }
}
