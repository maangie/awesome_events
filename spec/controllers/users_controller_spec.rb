require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'ログインユーザが retire にアクセスしたとき' do
    before do
      session[:user_id] = create(:user).id
      get :retire
    end

    it 'render される' do
      expect(response).to render_template :retire
    end
  end

  pending '未ログインユーザが retire にアクセスしたとき'
  pending 'destroy'
end
