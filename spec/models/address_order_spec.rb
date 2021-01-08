require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep 1
    @address_order = FactoryBot.build(:address_order,user_id: @user.id, item_id: @item.id)
  end

  describe '購入' do
    context '保存ができる時' do
      it 'postal_codeとprefecture_idとcityとhouse_numberとphone_numberとuser_idとitem_idとtokenが存在していれば保存できること' do
        expect(@address_order).to be_valid
      end
    end

    context '保存ができない時' do
      it 'tokenが空では保存できないこと' do
        @address_order.token = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では保存できないこと' do
        @address_order.postal_code = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが無いと保存できないこと' do
        @address_order.postal_code = '1234567'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが空では保存できないこと' do
        @address_order.prefecture_id = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_id = 1では保存できないこと' do
        @address_order.prefecture_id = 1
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空では保存できないこと' do
        @address_order.city = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では保存できないこと' do
        @address_order.house_number = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        @address_order.phone_number = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12以上の場合無効な状態であること' do
        @address_order.phone_number = 12
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberにハイフンがある場合無効な状態であること' do
        @address_order.phone_number = '090-1234-5678'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが空では保存できないこと' do
        @address_order.user_id = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できないこと' do
        @address_order.item_id = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
