## Container の設計

ここでは、先程作った Path と Query を複数持つような structure の定義及び editor の設計をします。

まずは Path から行きます。
structure 部分を右クリックし、'Concept' を選択します。
名前は `PathContainerConcept` としましょう。
この Concept では子要素として PathConcept を複数持ちますので、children に `paths : PathConcept[0..n]` というように書きます。

続いて editor です。
editor 部分を右クリックし、'Concept Editor' を選択します。
cell layout は先程まで見てきたものとは少し異なりますが、補完に頼ればほぼ困ることはありません。
Horizontal Collection を入力すると、`paths Link` というボタンが表示されるはずですので、これをクリックします。
`paths:`というのはただの文字列で今回は要らないので削ります。残しておいても構いません。


次に Query を見ていきます。
といっても、作りは `PathContainerConcept` と全く同じです。
children を `queries : QueryConcept[0..n]` とします。
editor は全く同じなので良き感じに作って下さい。

以上で Path と Query の設計が終わりました。
次はいよいよ structure / editor の最後、Url の設計に入ります。

