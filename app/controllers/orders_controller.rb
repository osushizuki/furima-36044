class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set
  before_action :item_user
  before_action :seller

  def index
    @order_consumer = OrderConsumer.new
  end

  def create
    @order_consumer = OrderConsumer.new(order_params)
    @item
    if @order_consumer.valid?
      pay_item
      @order_consumer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def item_set
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_consumer).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_user
    @consumer = Consumer.all
    @consumer.each do |consumer|
      if consumer.item_id == @item.id
        redirect_to root_path 
        break
      end
    end
  end

  def seller
    if @item.user == current_user
      redirect_to root_path
    end
  end

end
