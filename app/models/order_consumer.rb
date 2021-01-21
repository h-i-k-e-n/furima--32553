class OrderConsumer
  extend ActiveHash::Associations::ActiveRecordExtensions
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :postal_code, :address_id, :city, :address, :building_name, :tel_number, :token ,:order_id
  

  validates :token, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :address_id, presence: true, numericality: { other_than: 1 }
  validates :tel_number, presence: true, numericality: { only_interger: true, message: 'Input only number' }
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }

  
 
  def save
    
    order = Order.create(item_id: item_id, user_id: user_id)
   
    Consumer.create!(postal_code: postal_code, address_id: address_id, city: city, address: address, building_name: building_name,tel_number: tel_number,order_id: order.id)
   
  end
end
