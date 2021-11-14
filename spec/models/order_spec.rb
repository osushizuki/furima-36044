require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it "全ての項目が入力されていれば保存できる" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "postal_codeが空では保存ができないこと" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal_code can't be blank")
    end

    it "cityが空では保存ができないこと" do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it "addressが空では保存ができないこと" do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空では保存ができないこと" do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone_number can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end