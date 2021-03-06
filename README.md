# README

## ユーザー視点でのアプリケーション概要
このアプリケーションはTwitterアカウントでのみログインすることが可能です。
Twitterアカウントでログイン後、そのアカウントの情報を使いユーザーを作成、登録。

Twitterのフォローしている人またはフォローされている人でかつ、このアプリケーションに登録しているユーザーを表示し、会いたい人として登録することができる。

会いたい人として登録しても誰にも会いたいことがわからないが、相手も此方を会いたい人として登録した場合、マッチング成立となる。

会いたい人に直接言って断られるリスクが全くないという面が既存のアプリなどとは違う面となっている。

## 機能一覧
### ユーザーリソース管理
- Twitterアカウントを利用したユーザー登録
- 現状ユーザーアカウント削除やユーザー情報の変更などの機能はついてないない。

### 会いたい人(コード中ではRelationship)リソース管理
- フォローしているかフォローされている人で、かつTwioffに登録しているユーザーを会いたい人として登録することが可能
- マッチしなかった場合に限り解除することが可能
- 会いたい人として自分が登録されている事や、全員の会いたい人を見ることは不可能。

## アプリケーションの設計等

- [DBテーブル定義表](https://docs.google.com/spreadsheets/d/1SnqBLW3j6g42VCw2Wj8Xrs46TG7scQD0lQGD0vpYV9E/edit?usp=sharing)
- [画面遷移図](https://github.com/shin30914/twioff/blob/master/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3.png)
- [ER図](https://drive.google.com/file/d/1KeMqB7tj0YLoHBJaZsQ48l74G1l_kRVT/view?usp=sharing)

## RailsやRuby標準以外の利用サードパーティライブラリ
#### ログイン認証機能
- devise
- omniauth
- omniauth-twitter
#### 環境別キー管理
- dotenv-rails
#### CSSフレームワーク
- bootstrap
#### ツイッターAPI操作
- twitter
#### JavaScriptフレームワーク
- jquery-rails
- webpacker
- react-rails


## アプリケーションのURL
[Twioff Ver.β](https://www.twioff.tokyo)

## ライセンス
This software is released under the MIT License, see LICENSE.txt.
