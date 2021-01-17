class ConsumersController < ApplicationController
def index
  @consumer = Consumer.all
end

  def new
@consumer = Consumer.new(item_params) 
end

def create
  Consumer.new(item_params)
end

private
def comment_params
  params.require(:consumer).permit(:postal_code, :city, :address, :building_name, :tel_number, :address_id, :order_id ).merge(user_id: current_user.id, item_id: params[:item_id])
end
end
