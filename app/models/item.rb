class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_source_id, presence: true
  validates :area_id, presence: true
  validates :mailing_date_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
  
end
