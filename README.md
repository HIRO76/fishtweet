# README

# fishtweet

## 概要

## 機能

## 技術

## fishtweet DBdesign

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
<a href="https://gyazo.com/babee840ede075263c93a63836a45f83"><img src="https://i.gyazo.com/babee840ede075263c93a63836a45f83.jpg" alt="Image from Gyazo" width="766"/></a>
------------------------
