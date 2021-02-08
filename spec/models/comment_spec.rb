require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの投稿' do
    it 'テキストがあればコメントできる' do
      expect(@comment).to be_valid
    end

    it 'テキストがないとコメントできない' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include('テキストを入力してください')
    end

    it 'ユーザーが紐付いていないとコメントできない' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Userを入力してください')
    end
  end
end
