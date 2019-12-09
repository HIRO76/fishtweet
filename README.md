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
https://www.dropbox.com/s/bqxnwc6wn7bf85f/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202019-12-09%2012.21.32.png?dl=0
------------------------
