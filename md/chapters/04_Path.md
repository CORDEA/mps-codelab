## Path の設計

それでは Path の設計を始めます。
structure 部分を右クリックし、'Concept' を選択します。
名前を `PathConcept` とします。

`PathConcept` では `INamedConcept` は実装しません。意味のある名前を別でつけましょう。
properties に `path : string` を定義します。

次に editor に移ります。
editor 部分を右クリックし、'Concept Editor' を選択します。
concept 名は `PathConcept` です。

path は `path /api` のような形での入力にしたいと考えています。
なので、cell layout としては Horizontal Collection を入力し、`path`、`{path}` というように書いていきます。

これで Path の設計は以上です。次は Query と Path を複数持つような構造を定義しましょう。

