class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :address
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image
#空の投稿を保存できないようにする
validates :title, presence: true
validates :text, presence: true
validates :price, presence: true, numericality:{only_interger: true }
validates :category_id, presence: true
validates :state_id, presence: true
validates :image, presence: true
validates :delivery_charge_id, presence: true
validates :delivery_day_id, presence: true
validates :address_id, presence: true


#ジャンルの選択が「--」の時は保存できないようにする
validates :category_id, :state_id, :address_id, :delivery_charge_id, :delivery_day_id,numericality: { other_than: 1 } 
end
