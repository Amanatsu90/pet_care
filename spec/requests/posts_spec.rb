require 'rails_helper'

describe PostsController, type: :request do
  before do
    @post = FactoryBot.create(:post)
  end

  describe 'GET #index' do
    it '正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'レスポンスに記事一覧が存在する' do
      get root_path
      expect(response.body).to include(@post.title)
    end
    it 'レスポンスに投稿された記事が存在する' do
      get root_path
      expect(response.body).to include('記事一覧')
    end
  end

  describe 'GET #show' do
    it '正常にレスポンスが返ってくる' do
      get post_path(@post)
      expect(response.status).to eq 200
    end
    it 'レスポンスに投稿記事の本文が存在する' do
      get post_path(@post)
      expect(response.body).to include(@post.text)
    end
    it 'レスポンスに投稿者のニックネームが存在する' do
      get post_path(@post)
      expect(response.body).to include(@post.user.nickname)
    end
    it 'レスポンスにコメント一覧表示が存在する' do
      get post_path(@post)
      expect(response.body).to include('コメント一覧')
    end
  end
end
