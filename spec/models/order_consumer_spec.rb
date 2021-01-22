require 'rails_helper'
RSpec.describe OrderConsumer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_consumer = FactoryBot.build(:order_consumer, item_id: @item.id, user_id: @user.id)
    sleep 1
  end
  
  describe '商品購入登録' do
    context '購入できるとき' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@order_consumer).to be_valid
    end
    it "建物名が抜けていても登録できること" do
      @order_consumer.building_name = nil
      expect(@order_consumer).to be_valid
    end
    
  end
    context '購入できないとき' do
      it 'postal_code が空だと保存できないこと' do
        @order_consumer.postal_code = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'user_id の入力が空だと保存できないこと' do
        @order_consumer.user_id = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id の入力が空だと保存できないこと' do
        @order_consumer.item_id = nil
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Item can't be blank")
      end
    it 'postal_code にハイフンの入力が空だと保存できないこと' do
      @order_consumer.postal_code = '00000000'
      @order_consumer.valid?
      expect(@order_consumer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
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
      it 'tel_numberが11桁以上の入力だと保存できないこと' do
        @order_consumer.tel_number = '000000000000'
        @order_consumer.valid?
        expect(@order_consumer.errors.full_messages).to include("Tel number is too long (maximum is 11 characters)")
    end
    it 'token  が空だと保存できないこと' do
      @order_consumer.token = nil
      @order_consumer.valid?
      expect(@order_consumer.errors.full_messages).to include("Token can't be blank")
    end
  end
end
end
