require 'rails_helper'

RSpec.describe Expence, type: :model do
  describe 'バリデーションのテスト' do
    it '金額が数字でなければ無効な状態であること' do
      expence = Expence.new(amount: 'test')
      expence.valid?
      expect(expence.errors.added?(:amount, :not_a_number, value: 'test')).to be_truthy
    end
  end
end
