require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    association :item
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name,first_name_kanaとlast_name_kana、birth_dateが存在すれば登録できる' do
        @user.password = 'aaa111'
        @user.first_name_kana = 'あ'
        @user.last_name_kana = 'あ'
        @user.first_name = 'あ'
        @user.last_name = 'あ'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = 'aaa111'
        @user.first_name_kana = 'あ'
        @user.last_name_kana = 'あ'
        @user.first_name = 'あ'
        @user.last_name = 'あ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.email = 'w@w'
        @user.password = 'aaa111'
        @user.first_name_kana = 'あ'
        @user.last_name_kana = 'あ'
        @user.first_name = 'あ'
        @user.last_name = 'あ'
        @user.valid?

        @user.save

        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordとpassword_confirmationの内容が一致しなければ登録できない' do
        @user.password = '00000'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが半角入力では登録できない' do
        @user.first_name = 'w'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'last_nameが半角入力では登録できない' do
        @user.first_name = 'あ'
        @user.last_name = 'w'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end

      it 'first_name_kanaが半角入力では登録できない' do
        @user.password = '111qqq'
        @user.first_name = 'あ'
        @user.last_name = 'あ'
        @user.first_name_kana = 'w'
        @user.last_name_kana = 'あ'

        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end

      it 'last_name_kanaが半角入力では登録できない' do
        @user.password = '111qqq'
        @user.first_name = 'あ'
        @user.last_name = 'あ'
        @user.first_name_kana = 'あ'
        @user.last_name_kana = 'w'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana  Full-width katakana characters')
      end
    end
  end
end
