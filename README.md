#  5degrees-protocol
**The smart contract of 5Degrees Protocol.** 

[![Version](https://img.shields.io/badge/Solidity->=0.8.0-lightgrey)](https://github.com/ethereum/solidity) [![EIP](https://img.shields.io/badge/protocol-EIP1155-yellowgreen)](https://eips.ethereum.org/EIPS/eip-155)

5Degrees is a Web3 social network protocol deployed on multi-chain. It aims to enable content creator to obtain his connections among communities and friends, and form a complete combinable, users-owned decentralized social network.

Here's how it works...

## Major Concepts

### ProfileNFT

ProfileNFT is the personal page NFT, the main object in 5Degress protocol. You can control all the contents of your NFT. The metadata format of EIP-1155.

ProfileNFT Struct:

```
/**
 * @notice A struct containing profile data.
 *
 * @param name The nickname of this profile.
 * @param image The avatar of this profile.
 * @param maxSupply Follower limitation of this profile NFT.
 * @param tokenSupply Follower count of this profile NFT.
 * @param totalBalance Following count of this profile NFT.
 * @param properties Extension data of this profile NFT,eg:twitter,mirror...
 */
struct TokenURIInfo {
    string name;
    string image;
    uint256 maxSupply;
    uint256 tokenSupply;
    uint256 totalBalance;
    string properties;
}
```

### Follow

The ID of Follow NFT is serialized to the address of the creator (the one being followed), which ensures the uniqueness of the NFT ID.

*Single & Batch Operator Diffent*

> mint or burn single: msg.sender
>
> mint or burn  batch: tx.origin

```
/**
* @notice The operator address is msg.sender.
*	
* @param account which address to follow or unfollow.
*/
function mint(address account) external;

function burn(address account) external;
```

```
/**
* @notice The operator address is tx.origin.
*	
* @param account which address to follow or unfollow.
*/
function mintByOrigin(address account) external;

function burnOrigin(address account) external;
```

also can mint or burn for batch...

```
/**
* @notice The operator address is msg.sender.
*	
* @param account which address to follow or unfollow.
*/
function mintBatch(address[] memory accounts) external;

function burnBatch(address[] memory accounts) external;
```

```
/**
* @notice The operator address is tx.origin.
*	
* @param account which address to follow or unfollow.
*/
function mintBatchByOrigin(address[] memory accounts) external;

function burnBatchByOrigin(address[] memory accounts) external;
```

For the query, you can call `balanceOf(address owner, uint256 tokenId)` 

## Overview

### Protocol Documentation

See docs  ->  https://docs.5degrees.io/5degrees-protocol-of-web3/

### Installation

```
$ npm install @openzeppelin/contracts
```

### Contract Deployed

| Chain Network   | ChainID | Contract Address                           |
| --------------- | ------- | ------------------------------------------ |
| Ethereum (ETH)  | 1       | 0x8D5AC44F019Fa9D233d9F0c0A42d4d113eDf0C09 |
| BNB Chain (BSC) | 56      | 0x8D5AC44F019Fa9D233d9F0c0A42d4d113eDf0C09 |
| Polygon (MATIC) | 137     | 0x8D5AC44F019Fa9D233d9F0c0A42d4d113eDf0C09 |

### Test Network deployed

| Chain Network             | ChainID | Contract Address                           |
| ------------------------- | ------- | ------------------------------------------ |
| Rinkeby (ETH)             | 4       | 0x8D5AC44F019Fa9D233d9F0c0A42d4d113eDf0C09 |
| BNB Chain Test (BSC Test) | 97      | 0x8D5AC44F019Fa9D233d9F0c0A42d4d113eDf0C09 |
| Polygon Mumbai (MATIC)    | 80001   | 0x8D5AC44F019Fa9D233d9F0c0A42d4d113eDf0C09 |

### Usage

Open and free, you can use the protocol in the contracts by importing them:

```
pragma solidity >=0.8.0;

import "./IFiveDegrees.sol";

contract MyDapp {

  address public five_degrees_protocol = "0x8D5AC44F019Fa9D233d9F0c0A42d4d113eDf0C09";
		
  function following(address account) public {
    //TODO your dapp code of some require
				
    uint256 amount = IFiveDegrees(five_degrees_protocol).balanceOf(msg.sender, uint256(uint160(account)));
    if (amount < 1) {
	IFiveDegrees(five_degrees_protocol).mintByOrigin(account);
    }

    //TODO your dapp core code
  }
}
```



## License

5Degrees Protocol Contracts is released under the [License](https://github.com/5DegreesProtocol/5degrees-protocol/blob/main/LICENSE).
