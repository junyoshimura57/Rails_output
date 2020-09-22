require 'rails_helper'

RSpec.describe Expence, type: :model do
  describe 'バリデーションのテスト' do
    it '金額が数字でなければ無効な状態であること' do
      expence = Expence.new(amount: 'test')
      expence.valid?
      expect(expence.errors.added?(:amount, :not_a_number, value: 'test')).to be_truthy
    end
  end

  describe 'アソシエーションのテスト' do
    it '支出を登録すると関連する子供アカウントが作成されていること' do
      # child_user = FactoryBot.create(:child_user)
      expence = FactoryBot.create(:expence)
      # puts "子供アカウントは#{expence.user.inspect}"
      # puts "親アカウントは#{expence.user.parent.inspect}"
      # puts "支出は#{expence.inspect}"
      expect(expence.user).to be_valid
    end
  end
end
