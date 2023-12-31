// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";

import {
    BalanceSnapshot,
    BalanceSnapshotLib
} from "balance-snapshot/BalanceSnapshot.sol";

import { ERC20 } from "./utils/ERC20.sol";

contract BalanceSnapshotTest is Test {
    using BalanceSnapshotLib for BalanceSnapshot;

    address owner = address(1);
    address token = address(new ERC20());

    function testSnapshotTokenBalanceIncrement() public {
        BalanceSnapshot storage snapshot =
            BalanceSnapshotLib.take([owner], [token]);

        deal(token, owner, 100);

        snapshot.assertIncrGt(owner, token, 99);
        snapshot.assertIncrEq(owner, token, 100);
        snapshot.assertIncrLt(owner, token, 101);
    }

    function testSnapshotTokenBalanceDecrement() public {
        deal(token, owner, 200);

        BalanceSnapshot storage snapshot =
            BalanceSnapshotLib.take([owner], [token]);

        deal(token, owner, 100);

        snapshot.assertDecrGt(owner, token, 99);
        snapshot.assertDecrEq(owner, token, 100);
        snapshot.assertDecrLt(owner, token, 101);
    }

    function testSnapshotETHBalanceIncrement() public {
        BalanceSnapshot storage snapshot =
            BalanceSnapshotLib.take([owner], [BalanceSnapshotLib.ETH]);

        deal(owner, 100);

        snapshot.assertIncrGt(owner, BalanceSnapshotLib.ETH, 99);
        snapshot.assertIncrEq(owner, BalanceSnapshotLib.ETH, 100);
        snapshot.assertIncrLt(owner, BalanceSnapshotLib.ETH, 101);
    }

    function testSnapshotETHBalanceDecrement() public {
        deal(owner, 200);

        BalanceSnapshot storage snapshot =
            BalanceSnapshotLib.take([owner], [BalanceSnapshotLib.ETH]);

        deal(owner, 100);

        snapshot.assertDecrGt(owner, BalanceSnapshotLib.ETH, 99);
        snapshot.assertDecrEq(owner, BalanceSnapshotLib.ETH, 100);
        snapshot.assertDecrLt(owner, BalanceSnapshotLib.ETH, 101);
    }

    function testSnapshotIsolation() public {
        BalanceSnapshot storage snapshot =
            BalanceSnapshotLib.take([owner], [token]);

        uint256 balance = snapshot.getBalance(owner, token);

        assertEq(balance, 0);
    }
}
