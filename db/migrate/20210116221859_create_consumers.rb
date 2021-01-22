class CreateConsumers < ActiveRecord::Migration[6.0]
  def change
    create_table :consumers do |t|
      t.string  :postal_code         , null: false
      t.string  :city                , null: false
      t.string  :address             , null: false
      t.string  :building_name       
      t.string  :tel_number          , null: false
      t.integer :address_id          , null: false, foreign_key: true 
      t.integer :order_id            , foreign_key: true
      t.timestamps
    end
  end
end
