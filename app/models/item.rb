class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :category
  belongs_to :mailing
  belongs_to :source
  belongs_to :status
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
