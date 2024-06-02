#!/bin/bash
export IPFS_PATH=${PWD}/.ipfs
if [ ! -e /usr/local/bin/ipfs ]; then
    wget https://dist.ipfs.tech/kubo/v0.20.0/kubo_v0.20.0_linux-amd64.tar.gz
    tar -xzf kubo_v0.20.0_linux-amd64.tar.gz
    cd kubo
    sudo bash install.sh
    ipfs init
fi

ipfs daemon&
sleep 2
case $1 in
    "7B") ipfs get QmbvdJ7KgvZiyaqHw5QtQxRtUd7pCAdkWWbzuvyKusLGTw --output ./chatbot/llama/7B \
        && ipfs get QmQk7ZGkncnmVhCurrCViLeJVRmi5hhPEhYucpmJaj7MWi --output ./chatbot/llama/tokenizer.model \
        && ipfs get QmRvJ9GajwZnDHPfB6ThhRnQffL6YmZL35vyZeEBR1fuMu --output ./chatbot/llama/tokenizer_checklist.chk ;;
    "13B") ipfs get QmPCfCEERStStjg4kfj3cmCUu1TP7pVQbxdFMwnhpuJtxk --output ./chatbot/llama/13B \
        && ipfs get QmQk7ZGkncnmVhCurrCViLeJVRmi5hhPEhYucpmJaj7MWi --output ./chatbot/llama/tokenizer.model \
        && ipfs get QmRvJ9GajwZnDHPfB6ThhRnQffL6YmZL35vyZeEBR1fuMu --output ./chatbot/llama/tokenizer_checklist.chk ;;
    "30B") ipfs get QmSD8cxm4zvvnD35KKFu8D9VjXAavNoGWemPW1pQ3AF9ZZ --output ./chatbot/llama/30B \
        && ipfs get QmQk7ZGkncnmVhCurrCViLeJVRmi5hhPEhYucpmJaj7MWi --output ./chatbot/llama/tokenizer.model \
        && ipfs get QmRvJ9GajwZnDHPfB6ThhRnQffL6YmZL35vyZeEBR1fuMu --output ./chatbot/llama/tokenizer_checklist.chk ;;
    "65B") ipfs get QmdWH379NQu8XoesA8AFw9nKV2MpGR4KohK7WyugadAKTh --output ./chatbot/llama/65B \
        && ipfs get QmQk7ZGkncnmVhCurrCViLeJVRmi5hhPEhYucpmJaj7MWi --output ./chatbot/llama/tokenizer.model \
        && ipfs get QmRvJ9GajwZnDHPfB6ThhRnQffL6YmZL35vyZeEBR1fuMu --output ./chatbot/llama/tokenizer_checklist.chk ;;
    "all") ipfs get Qmb9y5GCkTG7ZzbBWMu2BXwMkzyCKcUjtEKPpgdZ7GEFKm --output ./chatbot/ ;;
    *) echo "Specify LLaMA model as argument. Valid models are: 7B, 13B, 30B, 65B or all"
esac
ipfs shutdown