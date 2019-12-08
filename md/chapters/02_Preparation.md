## 準備

### Project の作成

まずは Project を作成しましょう。

'Create New Project' から 'Language project' を選択します。
Project name, Language name は任意の値を入れてください。
'Create Runtime Solucation' と 'Create Sandbox Solution' に check を入れて 'OK' を押します。

### 依存関係の整理

次に依存関係を整理します。

まず runtime の依存関係を見ていきましょう。
runtime (四角の 'S') を右クリックし、'Module Properties' を選択します。
'Solution Properties' という画面が表示されるので、Dependencies に `jetbrains.mps.baseLanguage` を追加します (JDK でも大丈夫です)。
これは MPS において [Java に相当します](https://www.jetbrains.com/help/mps/base-language.htm)。すでに追加されているかもしれません。

続いて、その中の runtime (フォルダの 'M') を右クリックし、'Model Properties' を選択します (先程の 'Module Properties' ではありません)。
Used Languages に `jetbrains.mps.baseLanguage` を追加します。
Dependencies に `java.net@java_stub` と `java.io@java_stub` を追加します。これは、後ほど java.net.URI を使うからです。

次に Language (四角の 'L') を右クリックして 'Module Properties' を選択し、'Language Properties' を表示します。
Dependencies に `jetbrains.mps.execution.util` を追加します。これは後ほど `IMainClass` を実装するのに必要です。

Generator にも必要です。
generator (四角の 'G') を右クリックし、'Module Properties' を選択します。
'Generator Properties' の Dependencies に `jetbrains.mps.baseLanguage` を追加します。

最後に main@generator です。
generator では後ほど runtime を参照するため、runtime を dependencies に追加します。

おそらく変更はこれだけだと思いますが、念の為他の依存を載せておきます。
この先困ったときは一度依存関係を見直してみてください。

これで準備は完了です。次からは structure 及び editor を設計しましょう。

