// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IERC20 } from "openzeppelin/token/ERC20/IERC20.sol";
import { Strings } from "openzeppelin/utils/Strings.sol";

struct BalanceSnapshot {
    mapping(address => mapping(address => uint256)) balance;
}

library BalanceSnapshotLib {
    using BalanceSnapshotLib for BalanceSnapshot;

    bytes32 constant BALANCE_SNAPSHOT_POSITION = keccak256("balance.snapshot");

    function getBalanceSnapshot()
        internal
        pure
        returns (BalanceSnapshot storage snapshot)
    {
        bytes32 position = BALANCE_SNAPSHOT_POSITION;
        assembly {
            snapshot.slot := position
        }
    }

    function getBalance(
        BalanceSnapshot storage snapshot,
        address owner,
        address token
    ) internal view returns (uint256) {
        return snapshot.balance[owner][token];
    }

    function assertIncrEq(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = IERC20(token).balanceOf(owner);
        uint256 diff = ba - bb;
        require(
            diff == change,
            string.concat(
                Strings.toString(diff),
                "!=",
                Strings.toString(change)
            )
        );
    }

    function assertIncrGt(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = IERC20(token).balanceOf(owner);
        uint256 diff = ba - bb;
        require(
            diff > change,
            string.concat(
                Strings.toString(diff),
                "<=",
                Strings.toString(change)
            )
        );
    }

    function assertIncrLt(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = IERC20(token).balanceOf(owner);
        uint256 diff = ba - bb;
        require(
            diff < change,
            string.concat(Strings.toString(diff), ">", Strings.toString(change))
        );
    }

    function assertDecrEq(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = IERC20(token).balanceOf(owner);
        uint256 diff = bb - ba;
        require(
            diff == change,
            string.concat(
                Strings.toString(diff),
                "!=",
                Strings.toString(change)
            )
        );
    }

    function assertDecrGt(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = IERC20(token).balanceOf(owner);
        uint256 diff = bb - ba;
        require(
            diff > change,
            string.concat(
                Strings.toString(diff),
                "<=",
                Strings.toString(change)
            )
        );
    }

    function assertDecrLt(
        BalanceSnapshot storage snapshot,
        address owner,
        address token,
        uint256 change
    ) internal view {
        uint256 bb = snapshot.getBalance(owner, token);
        uint256 ba = IERC20(token).balanceOf(owner);
        uint256 diff = bb - ba;
        require(
            diff < change,
            string.concat(
                Strings.toString(diff),
                ">=",
                Strings.toString(change)
            )
        );
    }

    function take(
        address[] memory owners,
        address[] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[1] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[2] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[3] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[4] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[5] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[6] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[7] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[1] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[2] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[3] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[4] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[5] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[6] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[7] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }

    function take(
        address[8] memory owners,
        address[8] memory tokens
    ) internal returns (BalanceSnapshot storage) {
        BalanceSnapshot storage snapshot = getBalanceSnapshot();
        for (uint i = 0; i < owners.length; i++) {
            address owner = owners[i];
            for (uint j = 0; j < tokens.length; j++) {
                address token = tokens[j];
                snapshot.balance[owner][token] = IERC20(token).balanceOf(owner);
            }
        }
        return snapshot;
    }
}
