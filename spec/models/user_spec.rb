require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end

describe 'ユーザー登録' do
  context 'ユーザー登録できるとき'
  it 'ニックネーム、メールアドレス、パスワード、パスワード（確認）が存在すれば登録できる' do
    expect(@user).to be_valid
  end
  it 'パスワードは6文字以上で登録ができる' do
    @user.password = 'aaa123'
    @user.password_confirmation = 'aaa123'
    expect(@user).to be_valid
  end
  context 'ユーザーが登録できないとき'
  it 'ニックネームが空では登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it 'メールアドレスが空では登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'メールアドレスが重複すると登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  it 'メールアドレスは、@がないと登録できない' do
    @user.email = 'testtest.com'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  it 'パスワードが空だと登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'パスワードが存在しても確認用を含めて2回入力しないと登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'パスワードが6文字以下では登録できない' do
    @user.password = 'aa123'
    @user.password_confirmation = 'aa123'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
    @user.password = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'パスワードは数字のみでは登録できないこと' do
    @user.password = '123456'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'パスワードは全角では登録できないこと' do
    @user.password = 'ａａａａａａ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
 end
end
