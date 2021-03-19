require 'rails_helper'

RSpec.describe Sweet, type: :model do
  before do
    @sweet = FactoryBot.build(:sweet)
  end

  describe '投稿の登録' do
    context '投稿が登録できるとき'
    it '画像、商品名、購入価格、購入店舗、商品説明が存在すれば登録できる' do
      expect(@sweet).to be_valid
    end
    it '商品説明がなくても登録出来る' do
      @sweet.text = ''
      expect(@sweet).to be_valid
    end
    it '購入価格は半角数字であれば登録できる' do
      @sweet.price = 500
      expect(@sweet).to be_valid
    end
    context '投稿ができないとき'
    it '画像が空では登録できない' do
      @sweet.image = nil
      @sweet.valid?
      expect(@sweet.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと登録できない' do
      @sweet.name = ''
      @sweet.valid?
      expect(@sweet.errors.full_messages).to include("Name can't be blank")
    end
    it '購入価格が空だと登録できない' do
      @sweet.price = ''
      @sweet.valid?
      expect(@sweet.errors.full_messages).to include("Price can't be blank")
    end
    it '購入価格が全角数字だと登録できない' do
      @sweet.price = '３００'
      @sweet.valid?
      expect(@sweet.errors.full_messages).to include('Price is invalid')
    end
    it '購入価格が全角英字だと登録できない' do
      @sweet.price = 'ａｂａｂ'
      @sweet.valid?
      expect(@sweet.errors.full_messages).to include('Price is invalid')
    end
    it '購入価格が半角英字だと登録できない' do
      @sweet.price = 'abc'
      @sweet.valid?
      expect(@sweet.errors.full_messages).to include('Price is invalid')
    end
    it '購入価格が半角英数字混合だと登録できない' do
      @sweet.price = 'abc123'
      @sweet.valid?
      expect(@sweet.errors.full_messages).to include('Price is invalid')
    end
    it '購入価格が全角英数字混合だと登録できない' do
      @sweet.price = '１２３ａｂｃ'
      @sweet.valid?
      expect(@sweet.errors.full_messages).to include('Price is invalid')
    end
    it '購入店舗が登録されていないと登録できない' do
      @sweet.shop_info = ''
      @sweet.valid?
      expect(@sweet.errors.full_messages).to include("Shop info can't be blank")
    end
  end
end
