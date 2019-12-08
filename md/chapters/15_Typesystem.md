## 付録: Checking Rule による入力規則の設定

ここでは typesystem の Checking Rule を適用し、入力できる値に制限を設け、警告を出すような設定を行いましょう。

typesystem を右クリックし、'New' -> 'Checking Rule' を選択します。
名前は `check_UrlConcept` とします。

今回は scheme が http の場合に https にするように警告する rule を作成しようと思います。そのため、適用する対象の Concept は UrlConcept です。

applicable for に続いて、`concept = UrlConcept as urlConcept` と入力します。
conc くらいまで入力して Enter を押すとスムーズです。

あとは `do {}` の中に rule を記述していきます。

```java
do {
    if (urlConcept.scheme.equals("http")) {
        warning "Should use https." -> urlConcept;
    }
}
```

これで一致していない場合に警告を表示できます。

ただこれだけだと警告が出る位置が url の部分になってしまいます。
`warning` の部分にフォーカスを当て、Inspector を確認します。

node feature to highlight(optional) という項目がありますので、`property scheme` にします。
これで警告の位置が scheme になります。

ついでに Intentions で https に置き換えられるような Quick fix を作成しましょう。

typesystem を右クリックし、'New' -> 'Quick Fix' を選択します。
名前は `UseHttps` とします。

arguments には `node<UrlConcept>` を渡し、中で参照できるようにします。
`arguments:` に `node<UrlConcept> urlConcept` と定義します。

続いて、description を記述します。
Enter を押すと Function が補完されるので、中に説明を記載します。`"Replace with https";` とかで良いでしょう。

最後に実行された場合の処理を記述します。
scheme を https に変更すれば良いので、以下のように書きます。

```
execute(node)->void {
    urlConcept.scheme = "https";
}
```

これで sandbox を開き、http と入力すると警告が出るようになりました。また、Intentions により https に変換することもできます。

このように、typesystem などを使用することで様々な規則や機能を付加することができます。

