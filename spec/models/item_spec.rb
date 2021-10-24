require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

    context '出品できる場合' do
      it "全ての項目が入力されていれば保存できる" do
        expect(@user).to be_valid
      end
    end

    context '出品できない場合' do
      it "nameが空では保存できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "imageが空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "explanationが空では保存できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "category_idが1では保存できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "status_idが1では保存できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "shipping_source_idが1では保存できない" do
        @item.shipping_source_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping source can't be blank")
      end

      it "area_idが1では保存できない" do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it "mailing_date_idが1では保存できない" do
        @item.mailing_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Mailing date can't be blank")
      end

      it "priceが空では保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "userが紐付いていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it "priceが半角数字以外では保存できない" do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが299以下では保存できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが10000000以上では保存できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end
  end
end