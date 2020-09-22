require 'rails_helper'

describe '支出管理機能のテスト', type: :system do
  let(:parent_user) {FactoryBot.create(:parent_user, name: '親権者ユーザーA')}
  let(:child_user_a) {FactoryBot.create(:child_user, name: '子供ユーザーA', email: 'tester_a@example.com', parent: parent_user)}
  let(:child_user_b) {FactoryBot.create(:child_user, name: '子供ユーザーB', email: 'tester_b@example.com', parent: parent_user)}
  let!(:expence_a) {FactoryBot.create(:expence, name: 'うまい棒', user: child_user_a)}

  before do
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end

  describe '支出一覧表示機能のテスト' do
    context '子供ユーザーAでログインをしている場合' do
      let(:login_user) { child_user_a }

      it '子供ユーザーAの支出が表示されること' do
        expect(page).to have_content 'うまい棒'
      end
    end

    context '子供ユーザーBでログインしている場合' do
      let(:login_user) { child_user_b }

      it '子供ユーザーAの支出が表示されないこと' do
        expect(page).to have_no_content 'うまい棒'
        # p child_user_b.parent
      end
    end

    context '親権者ユーザーAでログインしている場合' do
      let(:login_user) { parent_user }

      it '子供ユーザーAの支出が表示されること' do
        expect(page).to have_content 'うまい棒'
        # p parent_user
      end
    end
  end

  describe '支出詳細表示機能のテスト' do
    context '子供ユーザーAがログインしている場合' do
      let(:login_user) { child_user_a }

      before do
        visit expence_path(expence_a)
      end

      it '子供ユーザーAが作成したタスクが表示されること' do
        expect(page).to have_content 'うまい棒'
      end
    end
  end

  describe '新規支出作成機能のテスト' do
    let(:login_user) { child_user_a }

    before do
      visit new_expence_path
      fill_in '名称', with: expence_name
      fill_in '金額', with: 100
      click_button '登録する'
    end

    context '新規作成画面で名称、金額を入力した場合' do
      let(:expence_name) {'たこ焼き'}

      it '正常に登録されること' do
        expect(page).to have_selector '.alert-success', text: 'たこ焼き'
      end
    end

    context '新規作成画面で名称を入力せず金額のみを入力した場合' do
      let(:expence_name) {''}

      it 'エラーとなること' do
        expect(page).to have_content '名称を入力してください'
      end
    end
  end
end
