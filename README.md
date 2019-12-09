# README

# fishtweet

## 概要
記事＆画像投稿型のシェアWebApp

## 機能
- 記事一覧表示機能
- 記事詳細表示機能
- 記事投稿機能
- 記事編集＆削除機能
- ユーザー登録及び認証機能
- ユーザー編集機能
- 画像ファイルアップロード機能（複数枚）
- DBのリレーション管理及びトランザクション制御機能
- ページネーション 
- 単体テスト＆統合テスト

## 技術&環境
- development環境
- Mysql 5.6.43 
- Rails 5.2.3
- ruby  2.5.1
- bootstrap4
- devise
- Rspec
- 画像アップロード　ActiveStorage

## fishtweet DB設計

### users
|Column|Type|Options|
|------|-----|------|
|nickname|string|null: false, index: true|
|email|string|null: false|
|avatar|string||
|password|string|null: false|
#### Association
- has_many :articles
- has_many :comments

### articles
|Column|Type|Options|
|------|-----|------|
|body|text|null: false|
|title|string|null: false|
|description|text||
|user|references|null: false, foreign_key: true|
|comment|references|null: false, foreign_key: true|
#### Association
- has_many :images
- has_many :comments
- belongs_to :user

### comments
|Column|Type|Options|
|------|-----|------|
|message|text||
|user|references|null: false, foreign_key: true|
|article|references|null: false, foreign_key: true|
#### Association
- belongs_to :user
- belongs_to :article

### images
|Column|Type|Options|
|------|-----|------|
|image|string|null: false|
|article|references|null: false, foreign_key: true|
#### Association
- belongs_to :article

## ERimage
[![Image from Gyazo](https://i.gyazo.com/42e72ff0719c93820cdcdc68e572fd26.png)](https://gyazo.com/42e72ff0719c93820cdcdc68e572fd26)
------------------------

## Appimage
Top＆一覧画面
[![Image from Gyazo](https://i.gyazo.com/d400df08b035769b1e3aa455e73d33af.jpg)](https://gyazo.com/d400df08b035769b1e3aa455e73d33af)

詳細ページ
[![Image from Gyazo](https://i.gyazo.com/e21e767166dddda9493a7e180c251526.jpg)](https://gyazo.com/e21e767166dddda9493a7e180c251526)

マイページ（１０件表示）
[![Image from Gyazo](https://i.gyazo.com/5a5f50c2d21a3f3554a00598bf8dc977.jpg)](https://gyazo.com/5a5f50c2d21a3f3554a00598bf8dc977)



<a href="https://gyazo.com/5a5f50c2d21a3f3554a00598bf8dc977"><img src="https://i.gyazo.com/5a5f50c2d21a3f3554a00598bf8dc977.jpg" alt="Image from Gyazo" width="858"/></a>
