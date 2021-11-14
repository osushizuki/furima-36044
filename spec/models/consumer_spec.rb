require 'rails_helper'

RSpec.describe Consumer, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "userが紐付いていないと保存できない" do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end

end
