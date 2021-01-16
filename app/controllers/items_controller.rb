class ItemsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
   
   
  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    @item = Item.find(params[:id])
  end
  
  def edit
     @item = Item.find(params[:id])
     redirect_to root_path unless current_user == @item.user
  end

  def update
    if @item = Item.find(params[:id])
      @item.update(item_params)
     redirect_to item_path(@item)
    else
     render :edit
    end
  end
  

  private
  def item_params
    params.require(:item).permit(:title, :price, :text, :category_id, :state_id, :address_id, :delivery_charge_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  
    
  end
  

