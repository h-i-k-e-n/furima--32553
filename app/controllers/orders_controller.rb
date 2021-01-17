class OrdersController < ApplicationController
  def index
  
    
end

  def new
    @item = Item.find(params[:item_id])
    
    @order = Order.new
end

def create
  @item = Item.find(params[:id])
  @order = @item.order.new(order_params)
end

private
def order_params
  params.require(:order).permit(:item_id ).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
end
end


