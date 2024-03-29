## 準備

### Project の作成

まずは Project を作成しましょう。

'Create New Project' から 'Language project' を選択します。Project name, Language name は任意の値を入れてください。
'Create Runtime Solution' と 'Create Sandbox Solution' に check を入れて 'OK' を押します。

<img src="./02_Preparation_01.png" width="700" />

### 依存関係の整理

次に依存関係を整理します。

まず runtime の依存関係を見ていきましょう。runtime (四角の 'S') を右クリックし、'Module Properties' を選択します。
'Solution Properties' という画面が表示されるので、Dependencies に `jetbrains.mps.baseLanguage` を追加します (JDK でも大丈夫です)。
`jetbrains.mps.baseLanguage` は MPS において [Java に相当します](https://www.jetbrains.com/help/mps/base-language.htm)。すでに追加されているかもしれません。

<img src="./02_Preparation_02.png" width="700" />

続いて、その中の runtime (フォルダの 'M') を右クリックし、'Model Properties' を選択します (先ほどの 'Module Properties' ではありません)。
Used Languages に `jetbrains.mps.baseLanguage` を追加します。

<img src="./02_Preparation_03.png" width="700" />

Dependencies に `java.net@java_stub` と `java.io@java_stub` を追加します。これは、後ほど `java.net.URI` を使うからです。

<img src="./02_Preparation_04.png" width="700" />

次に Language (四角の 'L') を右クリックして 'Module Properties' を選択し、'Language Properties' を表示します。
Dependencies に `jetbrains.mps.execution.util` を追加します。これは後ほど `IMainClass` を実装するのに必要です。

<img src="./02_Preparation_05.png" width="700" />

Generator にも必要です。
generator (四角の 'G') を右クリックし、'Module Properties' を選択します。
'Generator Properties' の Dependencies に `jetbrains.mps.baseLanguage` を追加します。

<img src="./02_Preparation_06.png" width="700" />

最後に main@generator です。
generator では後ほど runtime を参照するため、runtime を Dependencies に追加します。

<img src="./02_Preparation_07.png" width="700" />

この先困ったときは一度依存関係を見直してみてください。

これで準備は完了です。次からは structure 及び editor を設計しましょう。

