class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nick_name, presence: true, length: { maximum: 40 }
  validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください" }
  validates :birthday, presence: true
  validates :first_name, presence: true, format:{with:/\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）だけ使用してください"}
  validates :last_name, presence: true,format:{with:/\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）だけ使用してください"}
  validates :first_name_kanji, presence: true, format:{with:/\A[ぁ-んァ-ン一-龥]/, message: "は全角（漢字・ひらがな・カタカナ）だけ使用してください"}
  validates :last_name_kanji, presence: true, format:{with:/\A[ぁ-んァ-ン一-龥]/, message: "は全角（漢字・ひらがな・カタカナ）だけ使用してください"}

  has_many :items
  has_many :consumers
end
