#!/bin/sh

ESTACHAIN=geth

DATADIR=Estachain/estachain-data

GENESIS=Estachain/genesis.json
KEYSTORE=keystore
RPC_PORT=8545
RPC_ADDR=$(awk 'END{print $1}' /etc/hosts)
RPC_API="istanbul,clique,console,eth,web3,admin,debug,miner,personal,txpool,net"

# init the data directory
echo "Estachain INIT $RPC_ADDR"

$ESTACHAIN --datadir $DATADIR init $GENESIS

# start the node with the keystore and nodekey
echo "Estachain START"
$ESTACHAIN --rpc --rpcport $RPC_PORT --rpcapi "$RPC_API" --rpccorsdomain "*" --datadir $DATADIR --networkid 123 --nodiscover --keystore $KEYSTORE
  #--syncmode "full" \
  #--mine \
  #--miner.threads 1 \
  #--verbosity 4 \
  #--debug \
  #--networkid 123 \
  #--nodiscover
