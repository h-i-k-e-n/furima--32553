class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
@items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end 
  end
  
  private
  def item_params
    params.require(:item).permit(:title, :price, :text, :category_id, :state_id, :address_id, :delivery_charge_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  
end