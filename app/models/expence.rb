class Expence < ApplicationRecord
  validates :name, :amount, presence: true
  validates :amount, numericality: { only_integer: true }

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
end
