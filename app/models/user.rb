class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :expences, dependent: :destroy

  # 自己結合を定義
  has_many :children, class_name: 'User', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'User', optional: true
end
