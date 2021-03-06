# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル
| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| nick_name               | string     | null: false                    |
| email                   | string     | null: false,unique:true        |
| encrypted_password      | string     | null: false                    |
| birthday                | date       | null: false                    |
| first_name              | string     | null: false                    |
| last_name               | string     | null: false                    |
| first_name_kanji        | string     | null: false                    |
| last_name_kanji         | string     | null: false                    |

## Association
has_many :items
has_many :consumers

## items テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| category_id          | Integer    | null: false                    |
| status_id            | Integer    | null: false                    |
| shipping_source_id   | Integer    | null: false                    |
| area_id              | Integer    | null: false                    |
| mailing_date_id      | Integer    | null: false                    |
| price                | integer    | null: false                    |

## Association
belongs_to :user
has_one :consumer

## cards テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| prefecture_id        | Integer    | null: false                    |
| city                 | string     | null: false                    |
| address              | string     | null: false                    |
| building             | string     |                                |
| phone_number         | string     | null: false                    |
| consumer             | references | null: false, foreign_key: true |

## Association
belongs_to :consumer


## consumers テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

## Association
belongs_to :user
belongs_to :item
has_one :card