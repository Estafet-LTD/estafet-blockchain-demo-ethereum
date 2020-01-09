#!/bin/sh

ESTACHAIN=geth

DATADIR=Estachain/estachain-data

GENESIS=Estachain/genesis.json
KEYSTORE=keystore
RPC_PORT=8545
RPC_ADDR=$(awk 'END{print $1}' /etc/hosts)
#RPC_ADDR=127.0.0.1
RPC_API="istanbul,clique,console,eth,web3,admin,debug,miner,personal,txpool,net"
RPC_VHOST=go-ethereum-blockchain-demo-dq04.3.10.158.121.xip.io

# init the data directory
echo "Estachain INIT $RPC_ADDR"

$ESTACHAIN --datadir $DATADIR init $GENESIS

# start the node with the keystore and nodekey

#$ESTACHAIN --rpc --rpcport $RPC_PORT --rpcapi "$RPC_API" --rpcaddr $RPC_ADDR --rpccorsdomain "*" --datadir $DATADIR --nousb --networkid 123 --nodiscover --keystore $KEYSTORE

echo "Estachain START"
$ESTACHAIN --rpc --rpcport $RPC_PORT --rpcapi "$RPC_API" --rpcaddr $RPC_ADDR --rpccorsdomain "*" --rpcvhosts $RPC_VHOST --datadir $DATADIR --nousb --networkid 123 --nodiscover --keystore $KEYSTORE
  #--syncmode "full" \
  #--mine \
  #--miner.threads 1 \
  #--verbosity 4 \
  #--debug \
  #--networkid 123 \
  #--nodiscover
