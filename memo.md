# プロを目指す人のためのRuby入門

## chapter1

- [サンプルコード](https://github.com/JunichiIto/ruby-book-codes-v2)
- [公式リファレンス](https://github.com/JunichiIto/ruby-book-codes-v2)
  - **第一に公式リファレンスを参照すること**
  - 読み方がわからない場合は以下を参照
    - [Rubyの公式リファレンスが読めるようになる本](https://zenn.dev/jnchito/books/how-to-read-ruby-reference)
    - [るりまサーチ](https://docs.ruby-lang.org/ja/search/)

## chapter2

- Rubyはオブジェクト指向言語
- 文字列、配列、数値、審議値、nilも含めて全てがオブジェクト
- オブジェクトに対してメソッドを呼び出せる
- 同じ変数に数値を入れた後、文字列を入れたとしても、rubocopは指摘してくれない

  ```ruby
  x = 123
  puts x
  x = "test"
  puts x
  ```

- ダブルクオート内では特殊文字（改行文字など）や式展開が使える
- 普通の文字列を囲むにはシングルクオートでもダブルクオートでもどちらでも良い
  - コーディング規約があれば従うこと
- Rubyの審議値は、falseまたは**nil**であれば偽、それ以外であれば真
  - nilが偽なのは意外と便利であるらしい
- Rubyのif文は最後に評価された式を戻り値として返す
  - どの条件にも合致しなかった場合はnilを返す
- elsifだけ使ってelseが不要な場合はelseは省略可能
- ifは修飾子として後ろに置くこともできる

  ```ruby
  point *= 5 if day == 1
  ```

- Rubyでは最後に評価された式がメソッドの戻り値になる
  - returnも使えるが、使わないのが主流
    - returnはメソッドから途中で抜ける時には使われる

- &&や||では、左から順番に式を評価して、式全体の真または偽が確定した時点で戻り値を返す
- それを利用したコードが以下

  ```ruby
  # 見つかったユーザーを変数に代入する
  user = find_user('Alice') && find_user('Bob') && find_user('Carol')

  # userが正しい値ならメール送信を行う
  user.valid? && send.email_to(user)
  ```

- &&, ||に加えand, orもあるが、優先順位が異なるので注意

- 「== true」「== nil」は使わないように
  - 「num == nil」は例えば「!num」「num.nil?」に置き換えられる

- 真偽値を返す目的のメソッドには「?」がついている
- !で終わるメソッドは、そうでないメソッドより危険
  - 破壊的メソッドと呼ぶ
  - 以下の例では、aそのものを大文字に変えてしまっている

    ```ruby
    a = 'ruby'
    puts a.upcase => 'RUBY'
    puts a => 'ruby'
    puts a.upcase! => 'RUBY'
    puts a => 'RUBY'
    ```

- 式と文の違い
  - 戻り値を返すのが式
    - つまりifやメソッドは式
  - 戻り値を返さないのが文

- ライブラリを読み込むときはrequireを使う
  - golangでいうimport
- 自作のRubyプログラムを読み込むときはrequire_relativeで相対パスを指定する

## chapter3

- テスト用のフレームワーク（テスティングフレームワーク）として、Minitestを使用する
  - Railsでも使える

## chapter4

- 多重代入を使ってメソッドの戻り値を受け取る

  ```ruby
  quotient, remainder = 14.divmod(3) => 4, 2
  ```

- eachメソッドで配列の中身を1つ1つ取り出す
- 取り出した値をどう使うかをブロックに書く
- nはブロックに渡すパラメータ（ブロックパラメータ）
  - 以下のdoからendまでがブロック

    ```ruby
    numbers.each do |n|
      sum += n
    end
    ```

  - **doとendを{}に置き換える**ことで、1行でコンパクトに書くこともできる

    ```ruby
    numbers.each { |n| sum += n}
    ```

- JavaScriptのforEachのコールバック関数とは異なり、メソッドに渡せるブロックの数は1つだけ
  - ブロックを2つ以上渡したい場合は代わりにProcを使う

- Rubyでは要件によらず共通する処理はメソッド自身に、要件によって異なる処理をブロックに行わせる
  - だから色々な処理ができるメソッドがたくさん用意されている

- mapメソッド（collectメソッド）は各要素に対してブロックを評価した結果を新しい配列にして返す

- テスト駆動開発（TDD、Test Driven Development）
  - 以下のようなシチュエーションで向いている
    - プログラムのインプットとアウトプットが明確
    - テストコードの書き方が最初からイメージできている
  - 手順の詳細はP130

- メソッドの戻り値に対してまた別のメソッドを繋げていくコーディングスタイルをメソッドチェーンという

- map, selectなどの繰り返し処理に使われるメソッドはEnumerableモジュールに定義さrている
- 配列のArrayクラス、範囲オブジェクトのRangeクラス、uptoメソッドの戻り値であるEnumeratorクラスは、すべてEnumerableモジュールをincludeしているため、map, slectなどのメソッドを使える

- Rubyのthrow, catchは例外処理と関係がない
  - 例外処理にはraiseとrescueを使う

## chapter5

### ハッシュ

- ハッシュはキーと値の組み合わせでデータを管理するHashクラスのオブジェクト
  - 他の言語では連想配列、辞書、マップと呼ばれたりする

### シンボル

- シンボルは少し変わったデータ型
- 任意の文字列と一対一に対応するオブジェクト
- 文字列に似ているが同じ振る舞いをするわけではない
- 「:シンボル名」で定義する

- 文字列との違い
  - Symbolクラスである
  - Ruby内部では整数として管理されているため、文字列より高速
  - 同じシンボルであれば全く同じオブジェクトであるため、メモリの使用効率が良い
  - 文字列はミュータブルだが、シンボルはイミュータブル

- ソースコード上では名前を区別できるようにしたいが、その名前が文字列である必要はない場面でよく使われる
  - 代表的なのがハッシュのキー
    - 判別できるようにしたいが処理は早い方が良いのでうってつけ
  - プログラム上で区分や状態を管理したいときも
    - case文で定数の代わりにする

- ハッシュでシンボルをキーに使う場合
  - 「 key => value」を「:key => value」、さらには「key: value」で書ける

### ハッシュとキーワード引数

- キーワード引数を設定することで、デフォルト値を設定したり、呼び出し時の引数をわかりやすく設定したりできる

- ハッシュリテラルの{}の前後で構文エラーが発生する場合は、()の省略が原因になっていなか確認する
  - 例えば以下は両方ともエラーになる。{}を()で囲む必要がある

    ```ruby
    puts { foo: 1, bar: 2}
    assert_equal { foo:1, bar:2}, result
    ```

### &.演算子

- nilかもしれないオブジェクトに対して安全にメソッドを呼び出したい時に使う
- 呼び出されたオブジェクトがnilでないならその結果を、nilならnilを返す
- 例

  ```ruby
  a = 'foo'
  a&.upcase # => 'foo'

  b = nil
  b&.upcase # => nil
  ```

### ||=を使った自己代入

- 例
  - 以下は「limitがnilまたはfalseであれば10を代入し、それ以外ならlimitの値をそのまま使う」例

  ```ruby
  limit ||= 10
  # 内部的に以下のように評価される
  limit || limit = 10
  ```

- 「変数にnil以外の値を入れておきたい」という目的で使われることが多いため「nilガード」と呼ばれることがある

## chapter6

- `=~`を使うと、正規表現がマッチした場合は文字列中の最初にマッチした位置が返り、マッチしなければnilが返る
- `!~`を使うと、マッチしなかった時にtrue, マッチした時にfalseを返す

## chapter7

## オブジェクト指向プログラミングの基礎知識

- クラスはなぜ必要か？ハッシュではダメなのか？
  - ハッシュだとキーをタイプミスしてもnilで返ってくるため、ミスに気づきにくい
  - 要素の追加、内容の変更ができてしまう
- クラスを使うとデータとメソッドの整理がしやすい

- クラスを元にして作られたデータをオブジェクトまたはインスタンスと呼ぶ
- メソッドとの関係を説明するときに、オブジェクトのことをレシーバと呼ぶことがある
  - **レシーバは「メソッドを呼び出された側」のこと**を指す
  - 以下のコードで、first_nameメソッドのレシーバはuser

    ```ruby
    user = User.new('Alice', 'Ruby', 20)
    user.first_name
    ```

- 上記のコードで「userというレシーバに対して、first_nameという**メッセージ**を送っている」という説明もできる
- オブジェクトごとに保持されるデータのことを「オブジェクトの**状態（ステート）**」と呼ぶ
- オブジェクトから取得（もしくはオブジェクトに設定）できる値のことを**属性**（アトリビュート、プロパティ）と呼ぶ

- initializeメソッド
  - デフォルトでプライベートメソッド
  - 引数をつけるとnewメソッドを呼ぶときに引数が必要になる

- インスタンス変数は`@`から始まる
- クラス変数は`@@`から始まる
- グローバル変数は`$`から始まる
- 上記以外はローカル変数

- ゲッター
  - 以下のどちらでも値を取得できる

  ```ruby
  # @nameを外部から参照するためのメソッド
  def name
    @name
  end

  attr_reader :name
  ```

- セッター

  ```ruby
  # @nameを外部から変更するためのメソッド
  def name=(value)
    @name = value
  end

  attr_writer :name
  ```

- アクセサメソッド
  - ゲッターとセッターを総称してアクセサメソッドと呼び、以下のように書くことができる

  ```ruby
  attr_accessor :name
  ```

### クラスの定義

- メソッドに`self.`をつけるとクラスメソッドになる

- インスタンスメソッドは`クラス名#メソッド名`で表す
- クラスメソッドは`クラス名.メソッド名`または`クラス名::メソッド名`で表す

- 定数はインスタンスメソッド内でもクラスメソッド内でも同様に参照できる

### selfキーワード

- Rubyのselfキーワードはインスタンス自身を表す
  - Javaでいうthisキーワードとほぼ同じもの

- メソッド内でセッターメソッドを呼び出す場合はselfを必ずつける！

  ```ruby
  def rename_to_bob
    self.name = 'Bob'
  end
  ```

- クラス定義に存在するselfは場所によって表す意味が変わる
  - インスタンスメソッド内：「そのクラスのインスタンス自身」
  - クラス構文の直下またはクラスメソッド内：「クラス自身」

- クラスメソッドから「self」を使ってインスタンスメソッドを呼び出したり、逆にインスタンスメソッドから「self」を使ってクラスメソッドを呼び出したりできない
  - ただし、クラス構文の直下ではどちらもselfが「クラス自身」を表すため呼び出せる

- インスタンスメソッドからクラスメソッドを呼び出す場合
  - `クラス名.メソッド名`
  - `self.class.メソッド名`
    - `self.class`はそのインスタンスが属しているクラスを表すので、結果としては`クラス名.メソッド名`と書くのと同じ

### クラスの継承

- 継承を使いたい時は性質や概念が共通しているかどうかに着目する
  - 「サブクラス is a スーパークラス」と言えれば共通している
    - 例) DVD is a product.

- Rubyは単一継承
  - ただし、ミックスインという多重継承に似た機能を持つ

- 標準ライブラリの継承関係のトップにBasicObjectクラスが存在する
  - それをObjectクラスが継承している
    - String, Numeric, Array, HashはObjectクラスを継承している

- 継承元を指定せずに作成したクラスはデフォルトでObjectクラスを継承する

### メソッドの可視性

- privateメソッド
  - クラス内部でのみ使えるメソッド
  - 言い換えると、レシーバがselfに限定されるメソッド
  - **サブクラス呼び出したりオーバーライドしたりできる**
  - `private :foo :bar`などとメソッドを渡すと後からprivateにできる

- クラスメソッドをprivateにしたいとき
  - インスタンスメソッドとは異なり、`private`の下に記述してもprivateにはならない
  - `class << self`の構文の下に`private`と書く
  - または、`private_class_method`で後からprivateに変更する

- protectedメソッド
  - そのメソッドを定義したクラス自身と、そのサブクラスのインスタンスメソッドから**レシーバ付きで**呼び出せる

### 定数についてもっと詳しく

- 必ずクラス構文直下もしくはトップレベルで定義する
  - メソッドの内部では定義できない

- なんとRubyの定数は変更、再代入が可能！

### さまざまな種類の変数

- クラスインスタンス変数
  - クラス自身が保持しているデータ（クラス自身のインスタンス変数）
  - 同名で合ってもスーパークラスとサブクラスで異なる変数として参照される
- クラス変数
  - `@@`を変数名の最初につける
  - スパークラスとサブクラスで同一の変数として参照・代入可能
- グローバル変数
  - `$`から始める
  - クラス内外を問わずどこからでも参照・代入可能

### クラス定義やRubyの言語仕様に関する高度な話題

- 特定のオブジェクトに対してだけ紐づくメソッドのことを特異メソッドと呼ぶ
  - クラスもオブジェクトなので、クラスというオブジェクトに特異メソッドを定義しているクラスメソッドも特異メソッドである

- JavaやC#は静的型付け言語であり、抽象クラスやインタフェースがある
  - 静的型付け言語は、実行前に100％確実にそのメソッドが呼び出せることを保証する必要があるため、コンパイル前にオブジェクトのデータ型をチェックする
    - 特定のクラスを継承していたり、特定のインタフェースを実装していたら呼び出しOK、そうでなければNGというようにしている
- Rubyは動的型付け言語なのでそういった機能はない
  - 動的型付け言語は、**実行時に**そのメソッドが呼び出せるかどうかを判断している
  - Rubyが気にするのは、「コードを実行するその瞬間に、そのメソッドが呼び出せるか否か」
    - このようなプログラミングスタイルをダックタイピングという

- Rubyでは言語特性上オーバーロードは必要ない
  - 型や個数の違いに関わらず引数を受け取ることができるため

## chapter8

- モジュールの特徴
  - モジュールからインスタンスを作成できない
  - 他のモジュールやクラスを継承できない

- モジュールをクラスにincludeして機能を追加することをミックスインという
  - 1つのクラスに複数のモジュールをミックスインできる
  - ミックスインを使って多重継承に似た仕組みを実現できる

### モジュールを利用したメソッド定義についてもっと詳しく

- Enumerableモジュール
  - 英語の意味は「数え切れないほどの」
  - 配列やハッシュ、範囲（Range）などの、何かしらの繰り返し処理ができるクラスにincludeされているモジュール
  - このモジュールにmap, select, find, countなど数多くのメソッドが定義されている
  - includeした先のクラスでeachメソッドが実装されてさえいれば、Enumerableモジュールに定義されたメソッドが使える

- Comparableモジュール
  - Comparableモジュールは比較に関するメソッドが定義されている
  - includeした先のクラスで`<=>`演算子が実装されていれば、Comparableモジュールに定義されたメソッドが使える

- `a <=> b`が次のような結果を返すように実装する必要がある
  - aがbより大きいなら正の整数
  - aとbが等しいなら0
  - aがbより小さいなら負の整数
  - aとbが比較できないならnil

- Kernelモジュール
  - puts, p, pp, print, reaquire, loopなどのメソッドを提供する
  - ObjetctクラスがKernelモジュールをincludeしているので、どのクラスでもkernelモジュールが使える

- トップレベルにはmainという名前のObjectクラスのインスタンスがselfとして存在している
  - Rubyのselfキーワードはインスタンス自身を表すので, self=main
  - KernelモジュールをincludeしているObjectクラスのインスタンスがmainなので、トップレベルでもputsやpなどが使える

### モジュールを利用した名前空間の作成

- 名前空間を分けるためにモジュールが使われる

- 名前空間でグループやカテゴリを分ける
  - クラス定義やモジュール定義を保存するファイルパスは、慣習として名前空間をディレクトリ名にし、クラス名やモジュール名をファイル名に対応させる
    - ディレクトリ名やファイル名はスネークケースにする

### 関数や定数を提供するモジュールの作成

- ミックスインとしてもモジュールの特異メソッドとしても使えるメソッドのことを、モジュール関数という
- モジュール関数は`モジュール名.#メソッド名`と表記することがある

### 状態を保持するモジュールの作成

- AwesomeApiという何らかのWeb APIを利用するライブラリがあるとする
  - ライブラリの実行に必要な設定値の情報は、**アプリ内で「唯一、一つだけ」の状態**になっていることが望ましい
    - このような「唯一、一つだけ」のオブジェクトを作る手法のことを、**シングルトンパターン**という

### モジュールに関する高度な話題

- 同名のメソッドがあった場合は以下の順番で呼ばれる
  - クラス自身, 2番目にincludeしたモジュール, 最初にincludeしたモジュール, スーパークラスのモジュール, スーパークラスのスーパークラスであるObjectクラスのモジュール
  - ただし、`prepend`でモジュールをミックスインするとクラスより優先順位が上がる
  - `prepend`は「先頭に追加する」という意味の英単語

- Rubyはクラスの継承に制限がない
- 組み込みライブラリのクラスも継承して独自クラスを定義できる
- 定義済みのクラスそのものにメソッドを追加したり、メソッドの定義を上書きしたりできる
  - クラスの変更に対して自由なので**オープンクラス**と呼ばれる
  - 既存のメソッドを上書きすることを**モンキーパッチ**という
  - 不具合の原因になりうる
    - リスクを低減するため、`refinements`を使って、独自の変更のスコープを限定する

## chapter9

### 例外の捕捉

- Rubyの例外捕捉にはbegin, rescueを使う
- Rubyでは発生した例外自体もオブジェクトである
  - 例外オブジェクトのメソッドを用いて例外に関する情報を取得できる
    - messageメソッド：例外発生時のエラーメッセージを返す
    - backtraceメソッド：バックトレース情報（メソッドの呼び出し履歴）を配列にして返す
- rescue節に何も指定されなかった場合は`StandError`クラスとそのサブクラスのエラーが捕捉される
  - 通常のエラーであれば`StandError`クラスで捕捉できる
  - rescue節に`Exception`クラスを指定するのは好ましくない
- rescue節でretry文を実行すると、begin節の処理を最初からやり直せる
  - ネットワークエラーなど一時的なエラーの場合はこれで解消できる可能性もある
  - 無限にretryし続けないよう、カウンタ変数で回数制限を設ける

### 意図的に例外を発生させる

- 例外を発生させる場合はraiseメソッドを使う

### 例外処理のベストプラクティス

- 例外処理はうまく使わないとプログラムに余計な混沌を招く
- 使うべきシーンと使うべきでないシーンを区別する

- 安易にrescueを使わない
  - 即座に異常終了させるか、フレームワークの共通処理に投げる

- rescueした場合は必ず例外発生時の情報を残す
  - 例外クラス名、エラーメッセージ、バックトレースはログやターミナルに必ず出す

- 例外処理の対象範囲と対象クラスを極力絞り込む

- 例外処理よりも条件分岐を使う

- 予期しない条件は異常終了させる
  - 複数の条件を持つ条件分岐では、想定可能な条件だけを明示的に処理して、通常あり得ない条件については例外を発生させることを検討する
    - 微妙におかしい状態のまま処理を継続するよりは、例外を発生させてストップさせてしまう方が後々良い

- 例外処理も手を抜かずにテストする
  - 例外処理部分のコードにミスがあると、肝心な時に対処できなくなってしまう

### 例外についてもっと詳しく

- 例外が発生してもしなくても実行したい処理はensure節に書く

## chapter10

### イントロダクション

- この章で学ぶこと
  - ブロックを利用するメソッドの定義
  - ブロックの処理を引数や変数として渡す方法

### ブロックを利用するメソッドの定義とyield

- そもそもブロックとは、メソッドの引数として渡すことができる処理のかたまり
- ブロック付きでメソッドを呼び出したり、引数として渡したりできる
  - 呼び出されたメソッド内で`yield`を実行するとブロックの処理が実行される
- ブロックを引数として渡すメリット
  - **ブロックを他のメソッドに引き渡せるようになること**
    - 引数としてブロックを渡すときはブロック名に`&`をつける
  - ブロックに対する何かしらの操作を実行できる
    - 例えば、arityメソッドを使うとブロックパラメータの個数を確認できる
      - arityメソッドはProcクラスのインスタンスメソッド

### Procオブジェクト

- Procクラスは**ブロックをオブジェクト化するためのクラス**
- Procクラスは「何らかの処理（手続き・Procedure）」を表す
- ProcオブジェクトはJavaScriptでいう関数オブジェクトのようなもの
  - わかるようなわからないような。。

- Procオブジェクトはブロックと同じように「処理の塊」を表す
  - ブロックとは異なり、オブジェクトとして扱える
  - blockはProcオブジェクトのインスタンス

- Procオブジェクトを作る方法として、ラムダという方法もある
  - Proc.newなどと違って引数の数の過不足があるとエラーになるという特徴を持つ

## Chapter11

- パターンマッチはざっくりいうと一種の条件分岐
- 関数型言語において頻繁に使われる
- 特徴
  - 配列やハッシュの構造をパターン化して条件分岐させている
  - in節で=を使わずにローカル変数の宣言と代入が行われている
