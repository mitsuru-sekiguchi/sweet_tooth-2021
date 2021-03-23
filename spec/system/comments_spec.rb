require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  before do
    @sweet = FactoryBot.create(:sweet)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは詳細ページでコメント投稿ができる' do
    #  ログインする
    sign_in(@sweet.user)
    #  投稿詳細ページに遷移する
    visit sweet_path(@sweet)
    #  フォームに情報を入力する
    fill_in 'comment_text', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1あがることを確認
    expect  do
      find('input[name="commit"]').click
    end.to change { Comment.count }.by(1)
    #  詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(sweet_path(@sweet))
    #  詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
  end
end
