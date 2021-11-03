ノードの起動
```
$ python3 blockchain.py 5000
$ python3 blockchain.py 5001
```

現在のブロックチェーンの参照
```
$ curl "http://localhost:5000/chain"
$ curl "http://localhost:5001/chain"
```

採掘（ブロックの追加）
```
$ curl "http://localhost:5000/mine"
$ curl "http://localhost:5001/mine"
```

ノードの登録（登録されているノード群が1つのネットワーク）
```
$ curl -X POST -H "Content-Type: application/json" -d '{
    "nodes": ["http://localhost:5001"]
}' "http://localhost:5000/nodes/register"
$ curl -X POST -H "Content-Type: application/json" -d '{
    "nodes": ["http://localhost:5000"]
}' "http://localhost:5001/nodes/register"
```

取引の追加（現在の取引に追加する, ブロックにはなってない）
```
$ curl -X POST -H "Content-Type: application/json" -d '{
 "sender": "d4ee26eee15148ee92c6cd394edd974e",
 "recipient": "someone-other-id",
 "amount": 5
}' "http://localhost:5000/transactions/new"
$ curl -X POST -H "Content-Type: application/json" -d '{
 "sender": "d4ee26eee15148ee92c6cd394edd974e",
 "recipient": "someone-other-id",
 "amount": 3
}' "http://localhost:5001/transactions/new"
```

ノード間のブロック・取引記録のずれを解消（一番長いチェーンが採用される, 叩いた本人しか解消されない）
```
$ curl "http://localhost:5000/nodes/resolve"
$ curl "http://localhost:5001/nodes/resolve"
```
