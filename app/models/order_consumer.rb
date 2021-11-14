class OrderConsumer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: {only_integer: true}
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    consumer = Consumer.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id , city: city, address: address, building: building, phone_number: phone_number, consumer_id: consumer.id)
  end
end