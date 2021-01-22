require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
  before do
     @item = FactoryBot.build(:item)
    
  end
  context '新規登録できるとき' do
  
  it "title,text,category_id,state_id,address_id,delivery_charge_id,delivery_day_id,user_id,priceが存在する時登録できる" do   
  
    expect(@item).to be_valid
  end
  end
  
  context '新規登録できないとき' do
     
    it "titleが空では登録できない" do
         @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
     end
     it "textが空では登録できない" do
         @item.text = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("Text can't be blank")
     end
     it "category_idが空では登録できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idの入力が１以外でなければでは登録できない" do
        @item.category_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Category must be other than 1")
       end
     it "state_idが空では登録できない" do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "state_idの入力が１以外でなければでは登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
       end
     it "address_idが空では登録できない" do
      @item.address_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Address can't be blank")
      end
      it "address_idの入力が１以外でなければでは登録できない" do
        @item.address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Address must be other than 1")
       end
     it "delivery_charge_idが空では登録できない" do
     @item.delivery_charge_id = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "delivery_charge_id入力が１以外でなければでは登録できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
       end
     it "delivery_day_idが空では登録できない" do
     @item.delivery_day_id = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it "delivery_day_idが入力１以外でなければでは登録できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
       end
      it "user_idが空では登録できない" do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
      end

      it "priceが空では登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "全角文字では登録できないこと" do
      @item.price = "１００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
     end
    it "半角英数混合では登録できないこと"do
    @item.price = "11ww"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
     end
    it "半角英語だけでは登録できないこと"do
    @item.price = "ww"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
     end
    it "300以下では登録できないこと"do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than 299")
     end
    it "10,000,000以上では登録できないこと"do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
     end
  end
  end
end