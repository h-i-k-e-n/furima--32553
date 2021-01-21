class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :title, :text, :category_id, :state_id, :delivery_charge_id, :delivery_day_id, :address_id, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { only_interger: true, greater_than: 299, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :state_id, :address_id, :delivery_charge_id, :delivery_day_id, numericality: { other_than: 1 }

  belongs_to :category
  belongs_to :state
  belongs_to :address
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image
  has_one :order
  
end
