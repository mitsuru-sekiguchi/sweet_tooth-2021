require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @sweet = FactoryBot.create(:sweet)
  end
  context '投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      basic_pass new_user_session_path
      # ログインする
      sign_in(@user)
      # 投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_sweet_path
      # フォームに情報を入力する
      attach_file 'sweet[image]', "#{Rails.root}/public/images/test_image.jpg"
      fill_in 'sweet_name', with: @sweet.name
      fill_in 'sweet_price', with: @sweet.price
      fill_in 'sweet_shop_info', with: @sweet.shop_info
      fill_in 'sweet_text', with: @sweet.text
      # 送信するとSweetモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Sweet.count }.by(1)
      # 投稿完了後、トップページに遷移する
      expect(current_path).to eq(root_path)
      # トップページには先程投稿した内容が存在することを確認する（画像）
      expect(page).to have_selector("img[src$='test_image.jpg']")
      # トップページには先程投稿した内容が存在することを確認する(商品名)
      expect(page).to have_content((@sweet.name.to_s))
    end
  end
  context '投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end

RSpec.describe '投稿編集', type: :system do
  before do
    @sweet1 = FactoryBot.create(:sweet)
    @sweet2 = FactoryBot.create(:sweet)
  end
  context '投稿を編集できるとき' do
    it 'ログインしたユーザーは自分が投稿した投稿を編集ができる' do
      # 投稿1を投稿したユーザーでログインする
      sign_in(@sweet1.user)
      # 投稿の詳細ページへ遷移する
      visit sweet_path(@sweet1)
      # 編集ページへ遷移する
      visit edit_sweet_path(@sweet1)
      # 投稿1に「編集」ボタンがあることを確認する
      expect(page).to have_content('編集')
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#sweet_name').value
      ).to eq(@sweet1.name)
      expect(
        find('#sweet_price').value
      ).to eq(@sweet1.price.to_s)
      expect(
        find('#sweet_shop_info').value
      ).to eq(@sweet1.shop_info)
      expect(
        find('#sweet_text').value
      ).to eq(@sweet1.text)
      # 投稿内容を編集する
      attach_file 'sweet[image]', "#{Rails.root}/public/images/test_image.2.jpg"
      fill_in 'sweet_name', with: "#{@sweet1.text}+編集したテキスト"
      # 編集してもSweetモデルのカウントは変わらないことを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Sweet.count }.by(0)
      # トップページに遷移する
      visit root_path
      # トップページには先ほど変更した内容の投稿が存在することを確認する（画像）
      expect(page).to have_selector("img[src$='test_image.2.jpg']")
      # トップページには先ほど変更した内容の投稿が存在することを確認する（商品名）
      expect(page).to have_content("#{@sweet1.text}+編集したテキスト")
    end
  end
  context '投稿編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した投稿の編集画面できない' do
      # 投稿1を投稿したユーザーでログインする
      sign_in(@sweet1.user)
      # 投稿詳細ページへ遷移する
      visit sweet_path(@sweet2)
      # 投稿2に「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集')
    end
    it 'ログインしていないと投稿の編集画面に遷移できない' do
      # トップページにいる
      visit root_path
      # 投稿詳細ページへ遷移する
      visit sweet_path(@sweet1)
      # 投稿1に「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集')
      # 投稿詳細ページへ遷移する
      visit sweet_path(@sweet2)
      # 投稿2に「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集')
    end
  end
end

RSpec.describe '投稿削除', type: :system do
  before do
    @sweet1 = FactoryBot.create(:sweet)
    @sweet2 = FactoryBot.create(:sweet)
  end
  context '投稿で削除できるとき' do
    it 'ログインしたユーザーは自らが投稿した投稿が削除できる' do
      # 投稿1を投稿したユーザーがログインできる
      sign_in(@sweet1.user)
      # 投稿詳細ページへ遷移する
      visit sweet_path(@sweet1)
      # 投稿1に「削除」ボタンがあることを確認する
      expect(page).to have_content('削除')
      # 投稿を削除するとレコードの数が1減ることを確認する
      expect do
        find_link('削除', href: sweet_path(@sweet1)).click
      end.to change { Sweet.count }.by(-1)
      # トップページに遷移する
      visit root_path
      # トップページには投稿1の内容が存在しないことを確認する（テキスト）
      expect(page).to have_no_content(@sweet1.name.to_s)
    end
  end
  context '投稿を削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した投稿の削除ができない' do
      # 投稿1を投稿したユーザーでログインする
      sign_in(@sweet1.user)
      # 投稿詳細ページへ遷移する
      visit sweet_path(@sweet1)
      # 投稿2に「削除」ボタンが無いことを確認する
      expect(
        all('.more')[0]
      ).to have_no_link '削除', href: sweet_path(@sweet2)
    end
  end
  it 'ログインしていない投稿の削除ボタンがない' do
    # トップページに移動する
    visit root_path
    # 投稿1に移動
    visit sweet_path(@sweet1)
    # 投稿1に「削除」ボタンが無いことを確認する
    expect(
      all('.more')[1]
    ).to have_no_link '削除', href: sweet_path(@sweet1)
    # 投稿2に移動
    visit sweet_path(@sweet2)
    # 投稿2に「削除」ボタンが無いことを確認する
    expect(
      all('.more')[0]
    ).to have_no_link '削除', href: sweet_path(@sweet2)
  end
end
RSpec.describe '投稿詳細', type: :system do
  before do
    @sweet = FactoryBot.create(:sweet)
  end
  it 'ログインしたユーザーは投稿詳細ページに遷移してコメント欄が表示される' do
    # ログインする
    sign_in(@sweet.user)
    # 詳細ページに遷移する
    visit sweet_path(@sweet)
    # 詳細ページにコメント用のフォームが存在する
    expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態で投稿詳細に遷移できるがコメント欄が表示されない' do
    # トップページに移動する
    visit root_path
    # 投稿詳細ページに遷移する
    visit sweet_path(@sweet)
    # フォームが存在しないことを確認する
    expect(page).to have_no_selector 'form'
  end
end
