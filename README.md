# balance-snapshot

A Solidity library to improve balance change check in Foundry tests.

## Installation

```bash
$ forge install pilagod/balance-snapshot
```

## Usage

This library supports both ETH and token balance snapshot. Let's look at a quick example:

```solidity
import { Test } from "forge-std/Test.sol";
import { ERC20 } from "openzeppelin/token/ERC20/ERC20.sol";

import { BalanceSnapshot, BalanceSnapshotLib } from "balance-snapshot/BalanceSnapshot.sol";

contract ContractTest is Test {
    using BalanceSnapshotLib for BalanceSnapshot;

    function testToken() public {
        address token = address(new ERC20("TKN", "TKN"));

        address sender = address(1);
        address recipient = address(2);

        // Deal 100 token to sender
        deal(token, sender, 100);

        BalanceSnapshot storage snapshot = BalanceSnapshotLib.take(
            [sender, recipient],
            [address(token)]
        );

        // Transfer 100 token from sender to recipient
        vm.prank(sender); 
        ERC20(token).transfer(recipient, 100);

        // Sender token balance should decrease by 100
        snapshot.assertDecrEq(sender, token, 100);

        // Recipient token balance should increase by 100
        snapshot.assertIncrEq(recipient, token, 100);
    }

    function testETH() public {
        address sender = address(1);
        address recipient = address(2);

        // Deal 100 wei to sender
        deal(sender, 100);

        BalanceSnapshot storage snapshot = BalanceSnapshotLib.take(
            [sender, recipient],
            [BalanceSnapshotLib.ETH]
        );

        // Transfer 100 wei from sender to recipient
        vm.prank(sender);
        payable(recipient).transfer(100);

        // Sender ETH balance should decrease by 100 wei
        snapshot.assertDecrEq(sender, BalanceSnapshotLib.ETH, 100);

        // Recipient ETH balance should increase by 100 wei
        snapshot.assertIncrEq(recipient, BalanceSnapshotLib.ETH, 100);
    }
}
```

Please refer to [BalanceSnapshot.t.sol](https://github.com/pilagod/balance-snapshot/blob/main/test/BalanceSnapshot.t.sol) for more usages.
