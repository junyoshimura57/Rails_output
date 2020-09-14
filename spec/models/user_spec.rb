require 'rails_helper'

RSpec.describe User, type: :model do
  describe '1人目のユーザー登録がある際のテスト' do
    let(:user) { User.new(name: 'テスト 親一郎', email: 'tester@example.com', password: 'test_password')}

    context '名前、メールアドレス、パスワードがある場合' do
      it '有効な状態であること' do
        user.save
        expect(user).to be_valid
      end
    end

    context '重複したメールアドレスがある場合' do
      it '無効な状態であること' do
        user.save
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

  describe '1人目のユーザー登録からエラーになるケース' do  
    context '名前がない場合' do
      it '無効な状態であること' do
        user = User.new(name: nil)
        user.valid?
        expect(user.errors.added?(:name, :blank)).to be_truthy
      end
    end

    context 'メールアドレスがない場合' do
      it '無効な状態であること' do
        user = User.new(email: nil)
        user.valid?
        expect(user.errors.added?(:email, :blank)).to be_truthy
      end
    end
  end
end
