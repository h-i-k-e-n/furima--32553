class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create]
  before_action :set_item, only: [:new, :create]
  

  def new
    
      
      if current_user.id ==  @item.user_id || @item.order != nil
          redirect_to root_path  

     
            
      else
        @order_consumer = OrderConsumer.new
      end
  
    end
  
  def create
   
   
    @order_consumer = OrderConsumer.new(order_params)
    
    if @order_consumer.valid?
      
      pay_item
       
      @order_consumer.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def order_params
    params.require(:order_consumer).permit(:postal_code, :address_id, :city, :address, :building_name,:tel_number)
                                   .merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
