require 'rails_helper'

RSpec.describe User, type: :model do
  describe '1人目のユーザー登録がある際のテスト' do
    let(:user) { FactoryBot.build(:parent_user)}

    context '名前、メールアドレス、パスワードがある場合' do
      it '有効な状態であること' do
        user.save
        expect(user).to be_valid
      end
    end

    context '重複したメールアドレスがある場合' do
      it '無効な状態であること' do
        FactoryBot.create(:parent_user, email: 'tester@example.com')
        user = User.new(
          name: 'テスト 親二郎',
          email: 'tester@example.com',
          password: 'test_password'
        )
        user.valid?
        expect(user.errors.added?(:email, :taken, value: 'tester@example.com')).to be_truthy
      end
    end
  end

  describe '1人目のユーザー登録時点でエラーになるケース' do
    context '名前がない場合' do
      it '無効な状態であること' do
        user = FactoryBot.build(:parent_user, name: nil)
        user.valid?
        expect(user.errors.added?(:name, :blank)).to be_truthy
      end
    end

    context 'メールアドレスがない場合' do
      it '無効な状態であること' do
        user = FactoryBot.build(:parent_user, email: nil)
        user.valid?
        expect(user.errors.added?(:email, :blank)).to be_truthy
      end
    end
  end

  describe '親権者アカウントから子供アカウントの作成ができるいるかのテスト' do
    it '親権者アカウントから子供アカウントを生成する' do
      child_user = FactoryBot.create(:child_user)
      puts "子供アカウントは#{child_user.inspect}"
      puts "親アカウントは#{child_user.parent.inspect}"
    end
  end
end
