require 'rails_helper'

describe 'ユーザがイベントの参加や登録を行うために、ログインする' do
  context 'トップページに遷移し、"Twitter でログイン" をクリックしたとき' do
    context 'かつ Twitter でのログインに成功したとき' do
      before do
        visit root_path
        click_link 'Twitter でログイン'
      end

      it 'トップページに遷移していること' do
        expect(page.current_path).to eq root_path
      end

      it '"ログインしました" と表示されること' do
        expect(page).to have_content 'ログインしました'
      end
    end
  end
end
