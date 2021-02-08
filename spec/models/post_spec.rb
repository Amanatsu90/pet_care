require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '記事の投稿' do
    it '必須項目が全て存在すれば保存可' do
      expect(@post).to be_valid
    end

    it '画像が無くても保存可' do
      @post.image = nil
      expect(@post).to be_valid
    end

    it '記事のタイトルが空では保存不可' do
      @post.title = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('タイトルを入力してください')
    end
    
    it '記事のテーマを選択しないと保存不可' do
      @post.theme_id = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('テーマを選択してください')
    end
    
    it '愛犬のサイズを選択しないと保存不可' do
      @post.dog_size_id = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('愛犬のサイズを入力してください')
    end
    
    it '本文が空では保存不可' do
      @post.text = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('本文を入力してください')
    end
  end
end
