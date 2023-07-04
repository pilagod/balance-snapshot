# balance-snapshot

A Solidity library to improve balance change check in Foundry tests.

## Installation

```bash
$ forge install pilagod/balance-snapshot
```

## Usage

```solidity
import { Test } from "forge-std/Test.sol";
import { ERC20 } from "openzeppelin/token/ERC20/ERC20.sol";

import { BalanceSnapshot, BalanceSnapshotLib } from "balance-snapshot/BalanceSnapshot.sol";

contract ContractTest is Test {
    using BalanceSnapshotLib for BalanceSnapshot;

    function testToken() public {
        address owner = address(1);
        address token = address(new ERC20("TKN", "TKN"));

        BalanceSnapshot storage snapshot = BalanceSnapshotLib.take(
            [owner],
            [token]
        );

        // Do test actions...

        // Assert owner token balance increases 100 after test actions
        snapshot.assertIncrEq(owner, token, 100);
    }

    function testETH() public {
        address owner = address(1);

        BalanceSnapshot storage snapshot = BalanceSnapshotLib.take(
            [owner],
            [BalanceSnapshotLib.ETH]
        );

        // Do test actions...

        // Assert owner ETH balance increases 100 after test actions
        snapshot.assertIncrEq(owner, BalanceSnapshotLib.ETH, 100);
    }
}
```

Please refer to [BalanceSnapshot.t.sol](https://github.com/pilagod/balance-snapshot/blob/main/test/BalanceSnapshot.t.sol) for more examples.
