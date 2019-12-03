## 準備

### Project の作成

まずは Project を作成しましょう。
'Create New Project' から 'Language project' を選択します。
Project name, Language name は任意の値を入れて下さい。
'Create Runtime Solucation' と 'Create Sandbox Solution' に check を入れて 'OK' を押します。

### 依存関係の整理

次に依存関係を整理します。

まず runtime の依存関係を見ていきましょう。
runtime を右クリックし、'Model Properties' を表示します ('Module Properties' ではありません)。
Used Languages に baseLanguage を追加します。これは MPS に於いて Java に相当します (https://www.jetbrains.com/help/mps/base-language.htm)。
Dependencies に java.util@java_stub を追加します。これは、後ほど List を使うからです。

次に main@generator です。
generator では後ほど runtime を参照するため、runtime を dependencies に追加します。

これで準備は完了です。次は structure 及び editor を設計しましょう。

