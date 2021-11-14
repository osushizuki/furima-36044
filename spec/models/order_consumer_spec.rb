require 'rails_helper'

RSpec.describe OrderConsumer, type: :model do
  describe '商品購入' do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_consumer = FactoryBot.build(:order_consumer, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it "全ての項目が入力されていれば保存できる" do
        expect(@order_consumer).to be_valid
      end

      it "buildingは空でも保存できること" do
        @order_consumer.building = ''
        expect(@order_consumer).to be_valid
      end

    end
    context '内容に問題がある場合' do
      it "postal_codeが空では保存ができないこと" do
        @order_consumer.postal_code = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeが全角数字だと保存できないこと" do
        @order_consumer.postal_code = '０００-００００'
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "postal_codeに-を使わないと保存できないこと" do
        @order_consumer.postal_code = '1234567'
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが1では保存ができないこと" do
        @order_consumer.prefecture_id = '1'
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では保存ができないこと" do
        @order_consumer.city = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では保存ができないこと" do
        @order_consumer.address = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では保存ができないこと" do
        @order_consumer.phone_number = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが全角数字だと保存できないこと" do
        @order_consumer.phone_number = '０８０１２３４１２３４'
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Phone number is not a number")
      end

      it "tokenが空では登録できないこと" do
        @order_consumer.token = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Token can't be blank")
      end

      it "userが紐付いていないと保存できないこと" do
        @order_consumer.user_id = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("User can't be blank")
      end

      it "itemが紐付いていないと保存できないこと" do
        @order_consumer.item_id = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
