# ながのCAKE
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト。
DMM WEBCAMP 2ヶ月目のチーム開発フェーズで作られたものです。


## アプリケーションの詳細機能

- 顧客
  - 会員登録・ログインログアウト機能
  - 会員情報編集・配送先登録・退会機能
  - 商品の閲覧、カート機能、注文機能
  - 注文履歴確認
　- 文字検索、ジャンル検索
- 管理者
  - ログイン・ログアウト機能
  - 受注履歴確認、進捗ステータスの変更
  - 会員情報の確認・編集
  - 商品登録・編集・ジャンル設定


## 開発環境
  ■ 開発環境
    AWS Cloud9
  ■ フレームワーク
    Ruby on Rails(5.2.6)


## 使用方法
```
$ git clone https://github.com/webcamp-chageamma/nagano_cake
$ cd nagano_cake
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails s -b 0.0.0.0
```

【管理者用アカウント】
email: admin@test
pass: admin@test

【顧客用テストアカウント】
email: test1@test
pass: test1@test
(新規登録も可能です)


## 作成者
【チーム名：ちゃげあんま】
・幸地祐子
・佐藤由衣
・下中里奈
・山村美菜子

作成期間：2021/07/11~2021/07/28
