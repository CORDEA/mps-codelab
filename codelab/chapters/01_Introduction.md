## Introduction

[JetBrains MPS](https://www.jetbrains.com/mps/) は JetBrains が開発した言語ワークベンチです。

MPS は公式の Document が充実しており、[Getting started](https://www.jetbrains.com/help/mps/getting-started.html) や [MPS User's Guide](https://www.jetbrains.com/help/mps/mps-user-s-guide.html) などのこれからはじめる人向けの Document も多くあります。これらの Document を読めば MPS について理解することができますが、Document が膨大であるが故にはじめる前から何をすればいいのか悩んでしまう人も多いと思います。これはそのような人向けの「とりあえず使ってみる」というところに重点を置いた Codelab です。

この Codelab では、MPS の使い方がなんとなく分かるレベルを目指します。

難易度としては公式の Tutorial としてある [MPS Calculator Language Tutorial](https://www.jetbrains.com/help/mps/mps-calculator-language-tutorial.html) よりも簡単なくらいだと思います。
完了までにかかる時間は 1 時間程度です。

具体的には以下に触れていきます。

- runtime
- sandbox
- structure
- editor
- generator

以下については触れません。

- constraints
- behavior
- typesystem (付録で軽く触れます)

各役割についてはやっているうちに分かってくると思いますが、気になる場合は公式の Document を参照してください。

はじめる前に作るものも軽く紹介しておきます。作るのは URL builder です。

```
url https

example.com

pathSegment api
pathSegment v2

value = a
value = b
```

このように書くと、

```
https://example.com/api/v2?value=a&value=b
```

のような URL を build し出力する Java code を生成するために structure の定義、editor の設計、generator の作成を行います。

完成したものは以下の Repository にありますので、困ったらこちらも参照してみてください。

- [CORDEA/urlBuilder](https://github.com/CORDEA/urlBuilder)

それでは始めていきましょう。

