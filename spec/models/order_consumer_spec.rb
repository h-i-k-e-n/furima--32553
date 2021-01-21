require 'rails_helper'
RSpec.describe OrderConsumer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_consumer = FactoryBot.build(:order_consumer, item_id: @item.id, user_id: @user.id)
    sleep 1
  end
  
  describe '商品購入登録' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@order_consumer).to be_valid
    end
    
    it 'postal_code が空だと保存できないこと' do
      @order_consumer.postal_code = nil
      @order_consumer.valid?
      expect(@order_consumer.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'address_id が空だと保存できないこと' do
      @order_consumer.address_id = nil
      @order_consumer.valid?
      expect(@order_consumer.errors.full_messages).to include("Address can't be blank")
    end
    it 'city  が空だと保存できないこと' do
      @order_consumer.city = nil
      @order_consumer.valid?
      expect(@order_consumer.errors.full_messages).to include("City can't be blank")
    end
    it 'address が空だと保存できないこと' do
      @order_consumer.address = nil
      @order_consumer.valid?
      expect(@order_consumer.errors.full_messages).to include("Address can't be blank")
    end
    it 'tel_number が空だと保存できないこと' do
      @order_consumer.tel_number = nil
      @order_consumer.valid?
      expect(@order_consumer.errors.full_messages).to include("Tel number can't be blank")
    end
      it 'tel_numberが数字以外の入力だと保存できないこと' do
        @order_consumer.tel_number = 'あ'
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Tel number Input only number")
    end
    it 'token  が空だと保存できないこと' do
      @order_consumer.token = nil
      @order_consumer.valid?
      expect(@order_consumer.errors.full_messages).to include("Token can't be blank")
    end
  end
end
