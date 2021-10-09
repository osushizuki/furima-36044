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
| email                   | string     | null: false                    |
| encrypted_password      | string     | null: false                    |
| birthday                | string     | null: false                    |
| first_name              | text       | null: false                    |
| last_name               | text       | null: false                    |
| first_name_kanji        | text       | null: false                    |
| last_name_kanji         | text       | null: false                    |

## Association
has_many :items
has_many :cards

## items テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |
| category             | text       | null: false                    |
| status               | text       | null: false                    |
| shipping_source      | text       | null: false                    |
| area                 | text       | null: false                    |
| mailing_date         | text       | null: false                    |

## Association
belongs_to :user
belongs_to :card

## cards テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| card_number          | string     | null: false                    |
| expiry               | string     | null: false                    |
| Security             | string     | null: false                    |
| postal_code          | string     | null: false                    |
| prefecture           | text       | null: false                    |
| city                 | text       | null: false                    |
| address              | text       | null: false                    |
| building             | text       |                                |
| phone_number         | string     | null: false                    |

## Association
belongs_to :user
belongs_to :item

