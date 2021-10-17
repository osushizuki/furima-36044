require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it 'nick_name、email、password、password_confirmation、birthday、first_name、last_name、first_name_kanji、last_name_kanji、が存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
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

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
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

    it 'first_name_kanjiが空では登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it 'last_name_kanjiが空では登録できない' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'nick_nameが41文字以上では登録できない' do
      @user.nick_name = '01234567890123456789012345678901234567890'
      @user.valid?
      expect(@user.errors.full_messages).to include('Nick name is too long (maximum is 40 characters)')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'email内に@が存在しない場合登録できない' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英字だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ英数字をそれぞれ含めてください')
    end

    it 'passwordが半角数字だけでは登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ英数字をそれぞれ含めてください')
    end

    it 'first_nameが全角カタカナ以外では登録できない' do
      @user.first_name = '0a０wあ亞！!#$%&＃＄％＆'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は全角（カタカナ）だけ使用してください')
    end

    it 'last_nameが全角カタカナ以外では登録できない' do
      @user.last_name = '0a０wあ亞！!#$%&＃＄％＆'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name は全角（カタカナ）だけ使用してください')
    end

    it 'first_name_kanjiが全角以外では登録できない' do
      @user.first_name_kanji = 'aaaa1111'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanji は全角（漢字・ひらがな・カタカナ）だけ使用してください')
    end

    it 'last_name_kanjiが全角以外では登録できない' do
      @user.last_name_kanji = 'aaaa1111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kanji は全角（漢字・ひらがな・カタカナ）だけ使用してください')
    end

  end
end
