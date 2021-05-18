require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、kana_last_nameとkana_first_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confimationが半角英数字混合の場合、登録できる' do
        @user.password = '1a1a1a'
        @user.password_confirmation = '1a1a1a'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '1a1a1a'
        @user.password_confirmation = '1a1a1a'
        expect(@user).to be_valid
      end
      it 'emailに@が含まれる場合登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it 'last_nameとfirst_nameが全角文字の場合登録できる' do
        @user.last_name = 'やマ田'
        @user.first_name = 'たロ宇'
        expect(@user).to be_valid
      end
      it 'kana_last_nameとkana_first_nameが全角カナ文字の場合登録できる' do
        @user.kana_last_name = 'ヤマダ'
        @user.kana_first_name = 'タロウ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana last name can't be blank"
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれない場合登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1a1a1'
        @user.password_confirmation = '1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが半角英字のみの場合登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください',
                                                      'Password confirmation には英字と数字の両方を含めて設定してください'
      end
      it 'passwordが半角数字のみの場合登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください',
                                                      'Password confirmation には英字と数字の両方を含めて設定してください'
      end
      it 'passwordとpassword_confirmationの値が一致しない場合登録できない' do
        @user.password = '1a1a1a'
        @user.password_confirmation = '2a2a2a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name 全角文字を使用してください'
      end
      it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name 全角文字を使用してください'
      end
      it 'kana_last_nameがカタカナではない場合登録できない' do
        @user.kana_last_name = '山だ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Kana last name 全角カナ文字を使用してください'
      end
      it 'kana_first_nameがカタカナではない場合登録できない' do
        @user.kana_first_name = '太ろう'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Kana first name 全角カナ文字を使用してください'
      end
    end
  end
end
