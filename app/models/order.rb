class Order < ApplicationRecord
validates :user_id,:item_id presence: true

 belongs_to :item
 belongs_to :user
 has_one :consumer
end
