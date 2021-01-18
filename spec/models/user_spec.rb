require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必須項目が全て存在すれば登録可' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録可' do
        @user.password = 'ab1234'
        @user.password_confirmation = 'ab1234'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '名前が空では登録不可' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end

      it 'ニックネームが空では登録不可' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'ニックネームが7文字以上では登録不可' do
        @user.nickname = 'abcabca'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは6文字以内で入力してください')
      end

      it 'Eメールが空では登録不可' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したEmailが存在する場合登録不可' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに＠が含まれていないと登録不可' do
        @user.email = 'test.hotmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが空では登録不可' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下では登録不可' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録不可' do
        @user.password = 'ab1234'
        @user.password_confirmation = 'cd1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'ａｂ１２３４'
        @user.password_confirmation = 'ａｂ１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英字と半角数字の両方を含めて設定してください')
      end
      it 'passwordは半角英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英字と半角数字の両方を含めて設定してください')
      end
    end
  end
end
