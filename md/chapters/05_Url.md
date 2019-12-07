## Url の設計

ここでは、大本となる Url を設計します。

structure 部分を右クリックし、'Concept' を選択します。
名前は `UrlConcept` としましょう。

全体の構文は以下のような形でした。

```
url https

example.com

path /api

value = a
```

これにおける構成要素としては、scheme, host, paths, queries があるでしょう。
大本の structure の `name` はそのまま後に説明する sandbox の名前として扱われますので、host を `name` として使いましょう。
`UrlConcept` に `INamedConcept` を実装し、加えて properties に `scheme : string` を定義します。

children には `pathContainer : PathContainerConcept[1]` を定義します。これによって先程定義したとおり、path を複数持つことができます。
同じように queryContainer も定義しましょう。


`UrlConcept` ではもう少しやることが残っています。
まず、`UrlConcept` は大本となる structure なので `instance can be root` を `true` にして下さい。
加えて、`IMainClass` を実装します。これがないと sandbox で作成した Node が実行可能になりません。


続いて UrlConcept の editor を作成します。
'Vertical Collection' を作成し、さらに 'Horizontal Collection' を作成します。
ラベルとして url を入力し、scheme property をセットします。補完が出てこない場合は `{` を入力してから Enter を押すと出てきます。
続いて、1 つ `<constant>` を挟んで name property をセットします。1 つ `<constant>` を入れたあと 'New Cell' をクリックするとスムーズです。

また 1 つ `<constant>` を挟み、'pathContainer Link' をクリックします。`pathContainer:` というラベルは今回不要ですが、つけておいても良いでしょう。
その後 `<constant>` を挟んで今度は 'queryContainer Link' をクリックします。

これで Url の設計は終わりです。

