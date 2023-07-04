// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBalanceable {
    function balanceOf(address owner) external view returns (uint256);
}

struct BalanceSnapshot {
    mapping(address => mapping(address => uint256)) balance;
}

library BalanceSnapshotLib {
    using BalanceSnapshotLib for BalanceSnapshot;

    address internal constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    bytes32 private constant BALANCE_SNAPSHOT_POSITION =
        keccak256("balance.snapshot");

    function getBalanceSnapshot()
        private
        pure
        returns (BalanceSnapshot storage snapshot)
    {
        bytes32 position = BALANCE_SNAPSHOT_POSITION;
        assembly {
            snapshot.slot := position
        }
    }

    /**
     * @dev https://stackoverflow.com/a/65715388
     */
    function toString(uint256 v) private pure returns (string memory) {
        if (v == 0) {
            return "0";
        }
        uint256 j = v;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        j = v;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        return string(bstr);
    }

    function getBalance(
        BalanceSnapshot storage snapshot,
        address owner,
        address token
    ) internal view returns (uint256) {
        return snapshot.balance[owner][token];
    }

    function getBalance(
        address owner,
        address token
    ) internal view returns (uint256) {
        if (token == ETH) {
            return owner.balance;
        }
        return IBalanceable(token).balanceOf(owner);
    }

    function assertIncrEq(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = getBalance(owner, token);
        uint256 diff = ba - bb;
        require(
            diff == change,
            string.concat(toString(diff), "!=", toString(change))
        );
    }

    function assertIncrGt(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = getBalance(owner, token);
        uint256 diff = ba - bb;
        require(
            diff > change, string.concat(toString(diff), "<=", toString(change))
        );
    }

    function assertIncrLt(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = getBalance(owner, token);
        uint256 diff = ba - bb;
        require(
            diff < change, string.concat(toString(diff), ">", toString(change))
        );
    }

    function assertDecrEq(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = getBalance(owner, token);
        uint256 diff = bb - ba;
        require(
            diff == change,
            string.concat(toString(diff), "!=", toString(change))
        );
    }

    function assertDecrGt(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = getBalance(owner, token);
        uint256 diff = bb - ba;
        require(
            diff > change, string.concat(toString(diff), "<=", toString(change))
        );
    }

    function assertDecrLt(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = getBalance(owner, token);
        uint256 diff = bb - ba;
        require(
            diff < change, string.concat(toString(diff), ">=", toString(change))
        );
    }

    function take(
        address[] memory owners,
        address[] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint256 j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = getBalance(owner, token);
            }
        }
        return snapshot;
    }
}
