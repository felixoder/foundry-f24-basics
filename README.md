When we send someone some money
Then the transactions fields needs this -

1. Nonce: tx count for the account
2. Gas Price: price per unit of gas (in wei)
3. Gas Limit: max gas that this tx can use [21000 for ether]
4. To: address that the tx is sent to [address that the tx is sent to]
5. Value: amount of wei to send
6. Data: what to send to the "To" address [empty]
7. v, r, s : comments of tx signature

to run foundry
source /home/debayan/.zshenv
foundryup

## How to start with foundry \*\*\*

1. Install the foundry library` curl -L https://foundry.paradigm.xyz | bash`
2. add something to the source to add forge, anvil, cast, chisel `` source /home/debayan/.zshenv`
3. run `foundryup` `forge --version, anvil --version, cast --version, chisel --version`
4. `forge init ` To initialize a new foundry project
5. `forge compile` To compile the project
6. `anvil` to run the anvil : That will be important to onchain transactions and also deployment of the contract to onchain and add the link and import a nice Security key to metamask wallet
7. `forge create --interactive ` to DEPLOY [It will ask for a Private Key Provide the private key provided by anvil That you added to metamask Localhost]
8. `forge create SimpleStorage --rpc-url http://127.0.0.1:8545 --private-key ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80`
   This is the normal and ideal way to put the deployment logics

## Scripting logs

`forge script script/DeploySimpleStorage.s.sol --rpc-url  http://127.0.0.1:8545`
BroadCast `forge script script/DeploySimpleStorage.s.sol --rpc-url  http://127.0.0.1:8545 --broadcast --private-key ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80`

11. to convert the hex to dec ` cast --to-base 0x572e0 dec`

IMPORT KEYSTOTRES
cast wallet import sepoliaWallet --interactive
cast wallet list [to show all wallets]

`forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --account myPass --sender $ADDRESS --broadcast -vvvv `
`forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --account myPass --sender $ADDRESS --broadcast -vvvv `
`cast send $ADDRESS "store(uint256)" 123 --rpc-url $RPC_URL --private-key $PRIVATE_KEY`

`cast call $ADDRESS "retrieve()"`

FOR SEPOLIA
`forge script script/DeploySimpleStorage.s.sol --rpc-url $SEPOLIA_RPC_URL --account sepoliaWallet --sender 0x13bbf2898f904e9d206ab5363e25fe29be83103d --broadcast -vvvv `

[THE CONTRACT ADDRESS IS THE ADDRESS THAT WE GET AFTER DEPLOYING THE CONTRACT TO THE TESTNET]

TO USE THE CONTRACT [eg store function ]
`cast send 0x7C6fd774dd133F027EE00ce978bee9CACfa85eE6 "store(uint256)" 53 --rpc-url $SEPOLIA_RPC_URL --interactive`

TO RETRIEVE (view function)
`cast call 0x7C6fd774dd133F027EE00ce978bee9CACfa85eE6 "retrieve()"`

# FORMATTING THE CODE

forge fmt

FOR ZKSYNC

1.  install `foundry-zksync`
2.  Compile with `--zksync`
3.  Reinstall vanilla foundry

STEPS

1.  git clone https://github.com/matter-labs/foundry-zksync.git
2.  source /home/debayan/.zshenv
3.  foundryup-zksync
4.  foundryup [to override the all vanilla foundry]

RUN COMMAND 3 to get back the ZkSync

`forge build --zksync` = compile to L2 (zkSync)

`npx zksync-cli dev config `
`npx zksync-cli dev start`

DEPLOY TO ZKSYNC
`forge create src/SimpleStorage.sol:SimpleStorage --rpc-url http://127.0.0.1:8011 --private-key 0x7726827caac94a7f9e1b160f7ea819f172f7b6f9d2a97f992c38edeab82d4110 --legacy --zksync `

--legacy flag means type 1 transaction
and without --legacy flag it will be type 2 transaction
