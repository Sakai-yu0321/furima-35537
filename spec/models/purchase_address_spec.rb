require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end
  describe '商品購入' do
    context '購入できる時' do
      it 'user_id、item_id、postal_code、prefecture_id、municipality、address、phone_number、tokenが存在すれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'postal_codeに「-」が含まれていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberが11桁以内なら購入できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '購入できない時' do
      it 'postal_codeが空では購入できない' do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'prefecture_idが0では購入できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalityが空では購入できない' do
        @purchase_address.municipality = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'addressが空では購入できない' do
        @purchase_address.address = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では購入できない' do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'tokenが空では購入できない' do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeに「-」が含まれない場合購入できない' do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code Postal code is invalid. Enter it as follows (e.g. 123-4567)"
      end
      it 'postal_codeに全角文字が含まれる場合購入できない' do
        @purchase_address.postal_code = "123-あア亜"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code Postal code is invalid. Enter it as follows (e.g. 123-4567)"
      end
      it 'postal_codeに半角英字が含まれる場合購入できない' do
        @purchase_address.postal_code = "123-aaaa"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code Postal code is invalid. Enter it as follows (e.g. 123-4567)"
      end
      it 'phone_numberが9桁以下の場合購入できない' do
        @purchase_address.phone_number = "123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is too short (minimum is 10 characters)"
      end
      it 'phone_numberが12桁以上の場合購入できない' do
        @purchase_address.phone_number = "123456789012"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
      it 'phone_numberに全角文字が含まれる場合購入できない' do
        @purchase_address.phone_number = "123あああアアア亜亜"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is not a number"
      end
      it 'phone_numberに半角英字が含まれる場合購入できない' do
        @purchase_address.phone_number = "123aaaabbbb"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is not a number"
      end
    end
  end
end
