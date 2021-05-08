require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '購入情報が適切に入力されていれば購入できる' do
        expect(@purchase_order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @purchase_order.building_name = ''
        expect(@purchase_order).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'トークンが空では購入できない' do
        @purchase_order.token = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @purchase_order.postal_code = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @purchase_order.postal_code = '1234567'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code Input correctly")
      end
      it '発送先のidが1だと購入できない' do
        @purchase_order.shipping_area_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Shipping area Select")
      end
      it '市区町村が空では購入できない' do
        @purchase_order.city = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @purchase_order.address = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @purchase_order.phone_number = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は数値以外が入力されると購入できない' do
        @purchase_order.phone_number = 'test-123456'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号は12桁以上入力されると購入できない' do
        @purchase_order.phone_number = '090123456789'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number Input only number")
      end
      it 'ユーザーが紐づかないと購入できない' do
        @purchase_order.user_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐づかないと購入できない' do
        @purchase_order.item_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end