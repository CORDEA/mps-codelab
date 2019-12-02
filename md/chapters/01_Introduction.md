## Introduction

この Codelab では MPS の使い方がなんとなく分かるレベルを目指します。
難易度については公式の Tutorial としてある MPS Calculator Language Tutorial よりも簡単だと思います。

具体的には以下に触れていきます。

- runtime
- sandbox
- structure
- editor
- generator

以下については触れません。

- constraints
- behavior
- typesystem (軽く触れますが、全くの言って差し支えないレベルです)

各役割についてはやっているうちに分かってくると思いますが、気になる場合は公式のドキュメントを参照して下さい。

始める前に作るものも軽く紹介しておきます。作るのは URL builder です。

```
url https

example.com

path /api

value = a
```

このように書くと、

```
https://example.com/api?value=a
```

のような URL を build し出力する Java code を生成するために structure の定義、editor の設計、generator の作成を行います。
それでは始めていきましょう。

