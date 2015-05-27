require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'ログインユーザ' do
    before { session[:user_id] = create(:user).id }

    context 'retire にアクセスしたとき render する' do
      before { get :retire }
      it { expect(response).to render_template :retire }
    end

    context '退会するとユーザの数がひとつ減る' do
      let(:request) { delete :destroy }
      it { expect { request }.to change(User, :count).by -1 }
    end
  end

  pending '未ログインユーザ'
end
