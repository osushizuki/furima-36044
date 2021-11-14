class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_user

  def index
    @order_consumer = OrderConsumer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_consumer = OrderConsumer.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_consumer.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_consumer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_consumer).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def item_user
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

end
