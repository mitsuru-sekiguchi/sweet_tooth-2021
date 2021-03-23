require 'rails_helper'

RSpec.describe 'Sweets', type: :request do
  before do
    @sweet = FactoryBot.create(:sweet)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの投稿の商品名が存在する' do
      get root_path
      expect(response.body).to include(@sweet.name)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの投稿の画像が存在する' do
      get root_path
      expect(response.body).to include('test_image.jpg')
    end
    it 'indexアクションにリクエストするとレスポンスに検索フォームが存在する' do
      get root_path
      expect(response.body).to include('検索')
    end
  end
  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get sweet_path(@sweet)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの投稿の商品名が存在する' do
      get sweet_path(@sweet)
      expect(response.body).to include(@sweet.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの画像が存在する' do
      get sweet_path(@sweet)
      expect(response.body).to include('test_image.jpg')
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do
      get sweet_path(@sweet)
      expect(response.body).to include('コメント一覧')
    end
  end
end
