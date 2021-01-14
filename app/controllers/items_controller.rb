class ItemsController < ApplicationController

  def index
@items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
<<<<<<< Updated upstream
    @item = Item.new(item_params)
=======
    @item = Item.create(item_params)
    
>>>>>>> Stashed changes
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render "new"
    end
    
  end
 

end
