## 準備

準備の前に、MPS を使う上では補完を最大限活用するようにするとスムーズです。

この先、MPS の定義を書く部分がいくつかありますが、最初から Hint に頼るか、最初の数文字を打って補完に頼るようにしましょう。同じ文字を打っても同じ挙動にはなりません (大抵はエラーになります)。始まりの文字だけ打って Enter を押せば補完が効きます。また、Option+Enter (Intentions) も役に立つでしょう。

定義と同じく、Java のコードもあまり書かないほうが良いでしょう。基本的なコードは直接書いても認識されますが、MPS の内部では Java のコードも含めて XML で表現されます (generator.mps を見て下さい)。そのため、正しいコードを書いても IDE に認識されない限りは機能しません。

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

