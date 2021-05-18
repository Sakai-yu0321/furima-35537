require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる時' do
      it 'product_name、product_description、category_id、product_status_id、shipping_charge_id、prefecture_id、day_to_ship_id、price、imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが300~9999999の場合出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない時' do
      it 'product_nameが空では出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it 'product_descriptionが空では出品できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'product_status_idが1では出品できない' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Product status must be other than 1'
      end
      it 'shipping_charge_idが1では出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping charge must be other than 1'
      end
      it 'day_to_ship_idが1では出品できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Day to ship must be other than 1'
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank", 'Price is not a number'
      end
      it 'priceが299以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが10000000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'priceが半角数字ではない場合出品できない' do
        @item.price = 'aあア亜'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
