require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET #show' do
    it '正常にレスポンスが返ってくる' do
      get user_path(@user)
      expect(response.status).to eq 200
    end

    it 'レスポンスに該当ユーザーが投稿した記事一覧が存在する' do
      get user_path(@user)
      expect(response.body).to include("#{@user.nickname}さんの投稿一覧")
    end
  end

  describe 'GET #edit' do
    it '正常にレスポンスが返ってくる' do
      sign_in @user
      get edit_user_path(@user)
      expect(response.status).to eq 200
    end

    it 'レスポンスにユーザー名が存在する' do
      sign_in @user
      get edit_user_path(@user)
      expect(response.body).to include(@user.name)
    end

    it 'レスポンスにユーザーのメールアドレスが存在する' do
      sign_in @user
      get edit_user_path(@user)
      expect(response.body).to include(@user.email)
    end
  end
end
