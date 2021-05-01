require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '商品情報が適切に入力されていれば出品できる' do
        @item.item_category_id = 2
        @item.item_status_id = 2
        @item.shopping_charges_id = 2
        @item.shipping_area_id = 2
        @item.days_to_ship_id = 2
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空では出品できない' do
        @item.item_example = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item example can't be blank")
      end
      it '商品カテゴリーのidが1では出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item category must be other than 1')
      end
      it '商品状態のidが1では出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it '配送料のidが1では出品できない' do
        @item.shopping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping charges must be other than 1')
      end
      it '発送元のidが1では出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it '発送日数のidが1では出品できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が2桁では出品できない' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is too short (minimum is 3 characters)')
      end
      it '価格が8桁では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is too long (maximum is 7 characters)')
      end
      it '価格が300円以上でないと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it '価格が9999999円以下でないと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '価格が全角数字で入力されると出品できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が半角英数字で入力されると出品できない' do
        @item.price = '1000yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が半角英字で入力されると出品できない' do
        @item.price = 'testyen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
