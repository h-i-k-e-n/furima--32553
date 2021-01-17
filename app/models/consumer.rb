class Consumer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :postal_code,:city,:address,:building_name,:tel_number,:address_id,:order_id presence: true
  
  belongs_to :order
end
