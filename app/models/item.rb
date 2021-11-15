class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :category
  belongs_to :mailing
  belongs_to :source
  belongs_to :status
  has_one_attached :image
  has_one :consumer


  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_source_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :mailing_date_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true, format:{with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :image, presence: true

end
