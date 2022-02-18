pragma solidity >= 0.8.0;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

interface IFiveDegrees is IERC1155 {

    struct TokenURIInfo {
        string name;
        string image;
        uint256 maxSupply;
        string properties;
    }

    event Mint(address indexed account, address indexed owner, uint256 tokenId);

    event MintBatch(address[] indexed accounts, address indexed owner, uint256[] tokenIds);

    event Burn(address indexed account, address indexed owner, uint256 tokenId);
    
    event BurnBatch(address[] indexed accounts, address indexed owner, uint256[] tokenIds);

    function setProtocolInfo(string memory name, string memory image, string memory properties) external;

    function uri(uint256 tokenId) external view returns (string memory);

    function baseInfo(address account) external view returns (string memory, string memory);

    function metrics(address account) external view returns (uint256 tokenSupply, uint256 totalBalance);

    function setPayProxy(address proxy) external;

    function setInfo(string memory name, string memory image, string memory properties) external;

    function increaseMaxSupply(uint newMax) external payable;

    function decreaseMaxSupply(uint256 newMax) external;

    function mint(address account) external;

    function mintByOrigin(address account) external;

    function mintBatch(address[] memory accounts) external;

    function mintBatchByOrigin(address[] memory accounts) external;

    function burn(address account) external;

    function burnOrigin(address account) external;

    function burnBatch(address[] memory accounts) external;

    function burnBatchByOrigin(address[] memory accounts) external;
}