pragma solidity >= 0.8.0;

interface IPayProxy {
    function queryPay(address account, uint256 newMax, uint256 theMax) view external returns (address token, address receiver, uint amount);
}