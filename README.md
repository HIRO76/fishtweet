# README

# fishtweet

## 概要

## 機能

## 技術

## fishtweet DBdesign

### users
|Column|Type|Options|
|------|-----|------|
|nickname|varchar|null: false, index: true|
|email|varchar|null: false|
|avatar|blob||
|password|varchar|null: false|
#### Association
- has_many :articles
- has_many :comments

### articles
|Column|Type|Options|
|------|-----|------|
|body|text|null: false|
|title|varchar|null: false|
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
|image|mediumblob|null: false|
|article|references|null: false, foreign_key: true|
#### Association
- belongs_to :article

------------------------