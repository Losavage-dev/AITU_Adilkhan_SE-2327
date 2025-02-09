// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AITU_Adilkhan_SE_2327 is ERC20, Ownable {
    mapping(address => uint256) private _lastTransactionTimestamp;
    mapping(address => address) private _lastTransactionReceiver;

    constructor() ERC20("AITU_Adilkhan_SE-2327", "AITU") Ownable(msg.sender) {
        _mint(msg.sender, 2000 * 10 ** decimals());
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        bool success = super.transfer(recipient, amount);
        if (success) {
            _lastTransactionTimestamp[msg.sender] = block.timestamp;
            _lastTransactionReceiver[msg.sender] = recipient;
        }
        return success;
    }

    function getLastTransactionTimestamp(address user) external view returns (string memory) {
        uint256 timestamp = _lastTransactionTimestamp[user];
        require(timestamp > 0, "No transactions found");
        return _calculateTimeSince(timestamp);
    }

    function getLastTransactionSender(address user) external pure returns (address) {
        return user;
    }

    function getLastTransactionReceiver(address user) external view returns (address) {
        address receiver = _lastTransactionReceiver[user];
        require(receiver != address(0), "No transactions found");
        return receiver;
    }

    function getBalance(address account) external view returns (string memory) {
        uint256 balance = balanceOf(account);
        return string(abi.encodePacked(uint2str(balance / 10 ** decimals()), " tokens"));
    }

    function _calculateTimeSince(uint256 timestamp) internal view returns (string memory) {
        uint256 timeElapsed = block.timestamp - timestamp;

        uint256 totaldays = timeElapsed / 86400;
        uint256 totalhours = (timeElapsed % 86400) / 3600;
        uint256 totalminutes = (timeElapsed % 3600) / 60;
        uint256 totalseconds = timeElapsed % 60;

        return string(
            abi.encodePacked(
                uint2str(totaldays), " days, ",
                uint2str(totalhours), " hours, ",
                uint2str(totalminutes), " minutes, ",
                uint2str(totalseconds), " seconds ago"
            )
        );
    }

    function uint2str(uint256 _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i != 0) {
            k = k - 1;
            bstr[k] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}
