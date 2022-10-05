#!/bin/bash
# jerry.zhang

geth --datadir data init data/genesis.json
export ADDRESS=$(grep -o '"address": *"[^"]*"' ./data/keystore/accountKeystore | grep -o '"[^"]*"$' | sed 's/"//g')
export PRIVATE_CONFIG=ignore
geth --datadir data \
--networkid 1337 --nodiscover --verbosity 5 \
--syncmode full --mine --miner.threads 1 --miner.gasprice 0  \
--http --http.addr 127.0.0.1 --http.port 22000 --http.corsdomain "*" --http.vhosts "*" \
--ws --ws.addr 127.0.0.1 --ws.port 32000 --ws.origins "*" \
--http.api admin,eth,debug,miner,net,txpool,personal,web3,istanbul --ws.api admin,eth,debug,miner,net,txpool,personal,web3,istanbul \
--unlock ${ADDRESS} --allow-insecure-unlock --password ./data/keystore/accountPassword \
--port 30300
# if deployment in same host, need change rpc port.
--authrpc.port 8552 
