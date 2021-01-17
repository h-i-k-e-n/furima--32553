class ItemsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
   before_action :set_item, only: [:edit, :show, :update]
   
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
   
  end
  
  def edit
     
     redirect_to root_path unless current_user == @item.user
  end

  def update
     
    if  @item.update(item_params)
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
  def item_params
    params.require(:item).permit(:title, :price, :text, :category_id, :state_id, :address_id, :delivery_charge_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
    
  end
  

