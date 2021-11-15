class ItemsController < ApplicationController
  before_action :item_set, except: [:index,:new,:create]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :no_current_user, only: [:edit,:update,:destroy]
  before_action :sold_out, only: [:edit,:update,:destroy]

  def index
    @items = Item.order("created_at DESC")
    @consumer = Consumer.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if @item.consumer != nil
      @consumer = @item.consumer
    else
      @consumer = Consumer.new
    end
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_set
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:status_id,:shipping_source_id,:area_id,:mailing_date_id,:price,:image).merge(user_id: current_user.id)
  end

  def no_current_user
    unless current_user == @item.user
      redirect_to action: :index 
    end
  end

  def sold_out
    @consumer = Consumer.all
    @consumer.each do |consumer|
      if consumer.item_id == @item.id
        redirect_to action: :index 
        break
      end
    end
  end

end

