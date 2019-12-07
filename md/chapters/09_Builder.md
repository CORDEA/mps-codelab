## URL Builder の実装

それでは根幹となる URL Builder を実装しましょう。
ここからは普通の Java です (ただし IDE は普通ではない)。

runtime を右クリックし、'New' -> 'class' を選択します。
先ほどとは違って、冒頭に何もついていない空の class が生成されます。
ここに URL を build するための builder を作りましょう。

使い方としては以下のようなものを考えています。

```java
UrlBuilder builder = new UrlBuilder("https", "example.com");

builder.appendPathSegment("path")

builder.appendQuery("key", "value")

// https://example.com/path?key=value
String url = builder.build();
```

ここまで書けば作り方はなんとなく思い浮かぶと思います。
私の実装例を示しますが、実装はこの通りにする必要はありません。

なお import 文を書く必要はありません。
「Query の設計」で触れたように MPS 内部では XML で表現されており、そもそも Dependencies にない依存解決できないコードは書くことができません (書いても無視されます)。

```java
public class UrlBuilder {
  private final string scheme;
  private final string host;

  private string path = "";
  private string query = "";

  public UrlBuilder(string scheme, string host) {
    this.scheme = scheme;
    this.host = host;
  }

  public void appendPathSegment(string pathSegment) {
    if (path.endsWith("/") && pathSegment.startsWith("/")) {
      path += pathSegment.substring(1);
    } else if (path.endsWith("/") || pathSegment.startsWith("/")) {
      path += pathSegment;
    } else {
      path += "/" + pathSegment;
    }
  }

  public void appendQuery(string key, string value) {
    string encodedValue;
    try {
      encodedValue = URLEncoder.encode(value, "UTF-8");
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      return;
    }
    if (query.isEmpty) {
      query = key + "=" + encodedValue;
    } else {
      query += "&" + key + "=" + encodedValue;
    }
  }

  public string build() {
    URI uri = null;
    try {
      uri = new URI(scheme, null, host, -1, path, query, null);
    } catch (URISyntaxException e) {
      e.printStackTrace();
    }
    return uri == null ? "" : uri.toString();
  }
}
```

以上が実装例です。もっと簡単にするのも、もっと安全にするのもお任せします。

1 つ注意点として、ここでも基本的に自分で書くことは避けましょう。
Constructor や Method の呼び出し部分は特に、少し打ってから補完を出して書くことをおすすめします。自分で全部書いても認識されない場合があります。

次はこれを使用する generator の template を作成しましょう。

