require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
  before do
    @item = FactoryBot.build(:item)
  end
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
  it "state_idが空では登録できない" do
    @item.state_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("State can't be blank")
end
it "address_idが空では登録できない" do
  @item.address_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Address can't be blank")
end
it "delivery_charge_idが空では登録できない" do
  @item.delivery_charge_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
end
it "delivery_day_idが空では登録できない" do
  @item.delivery_day_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Delivery day can't be blank")
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


end
end
