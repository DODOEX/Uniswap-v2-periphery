pragma solidity >=0.6.2;
pragma experimental ABIEncoderV2;

struct RemoveLiquidityParams {
    address tokenA;
    address tokenB;
    uint256 fee;
    uint liquidity;
    uint amountAMin;
    uint amountBMin;
    address to;
    uint deadline;
    bool approveMax;
    uint8 v;
    bytes32 r;
    bytes32 s;
}

struct RemoveLiquidityETHParams {
    address token;
    uint256 fee;
    uint liquidity;
    uint amountTokenMin;
    uint amountETHMin;
    address to;
    uint deadline;
    bool approveMax;
    uint8 v;
    bytes32 r;
    bytes32 s;
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 fee,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint256 fee,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 fee,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint256 fee,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        RemoveLiquidityParams calldata params
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
       RemoveLiquidityETHParams calldata params
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        uint256[] calldata fees,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        uint256[] calldata fees,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, uint256[] calldata fees, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, uint256[] calldata fees, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, uint256[] calldata fees, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, uint256[] calldata fees, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut, uint256 fee) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut, uint256 fee) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path, uint256[] calldata fees) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path, uint256[] calldata fees) external view returns (uint[] memory amounts);
}
