class OrdersController < ApplicationController
  
  def index
    @order_consumer = OrderConsumer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_consumer = OrderConsumer.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_consumer.valid?
      @order_consumer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_consumer).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
