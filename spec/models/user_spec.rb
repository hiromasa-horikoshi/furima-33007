require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe '新規登録' do
      context '新規登録ができる時' do
        it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_reading、first_name_reading、birth_dateが存在すれば登録できること' do
          expect(@user).to be_valid
        end
      end

      context '新規登録ができない時' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailに@を含んでいない場合登録できないこと' do
          @user.email = 'hogehogehogegmail.com'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordが大文字・小文字・数値以外の場合無効な状態であること' do
          @user.password = '/' * 6
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'passwordが全角の場合無効な状態であること' do
          @user.password = 'あ' * 6
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'last_nameが空では登録できないこと' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
          @user.last_name = 'a' * 5
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end

        it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
          @user.first_name = 'a' * 5
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it 'last_name_readingが空では登録できないこと' do
          @user.last_name_reading = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading can't be blank")
        end

        it 'last_name_readingが空では登録できないこと' do
          @user.first_name_reading = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading can't be blank")
        end
        it 'last_name_readingが全角カタカナでなければ登録できないこと' do
          @user.last_name_reading = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name reading is invalid')
        end

        it 'first_name_readingが全角カタカナでなければ登録できないこと' do
          @user.first_name_reading = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name reading is invalid')
        end

        it 'birth_dateが空では登録できないこと' do
          @user.birth_date = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end
