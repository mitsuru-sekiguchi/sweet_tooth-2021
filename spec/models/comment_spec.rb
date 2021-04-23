require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
end

describe 'コメントの登録' do
  context 'コメントが登録できるとき'
  it 'コメントが存在すれば登録できる' do
    expect(@comment).to be_valid
  end
  context 'コメントが登録できないとき'
  it 'コメントが存在しないと登録できない' do
    @comment.text = ''
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Text can't be blank")

  end
 end
end
