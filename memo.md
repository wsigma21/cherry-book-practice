# プロを目指す人のためのRuby入門

## Chapter1

- [サンプルコード](https://github.com/JunichiIto/ruby-book-codes-v2)
- [公式リファレンス](https://github.com/JunichiIto/ruby-book-codes-v2)
  - **第一に公式リファレンスを参照すること**
  - 読み方がわからない場合は以下を参照
    - [Rubyの公式リファレンスが読めるようになる本](https://zenn.dev/jnchito/books/how-to-read-ruby-reference)

## Chapter2

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

## Chapter3

- テスト用のフレームワーク（テスティングフレームワーク）として、Minitestを使用する
  - Railsでも使える

## Chapter4

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