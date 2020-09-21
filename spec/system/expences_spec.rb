require 'rails_helper'

describe '支出管理機能', type: :system do
  describe '支出一覧表示機能' do
    let(:parent_user) {FactoryBot.create(:parent_user, name: '親権者ユーザーA')}
    let(:child_user_a) {FactoryBot.create(:child_user, name: '子供ユーザーA', parent: parent_user)}
    let(:child_user_b) {FactoryBot.create(:child_user, name: '子供ユーザーB', parent: parent_user)}

    before do
      FactoryBot.create(:expence, user: child_user_a)
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context '子供ユーザーAでログインをしているとき' do
      let(:login_user){ child_user_a }

      it '子供ユーザーAの支出が表示される' do
        expect(page).to have_content 'うまい棒'
      end
    end

    context `子供ユーザーBでログインしているとき` do
      let(:login_user){ child_user_b }

      it '子供ユーザーAの支出が表示されない' do
        expect(page).to have_no_content 'うまい棒'
      end
    end
  end
end