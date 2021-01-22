class Order < ApplicationRecord
  
  has_one :consumer
  belongs_to :item
  belongs_to :user
  
end
