class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  enum role:[:default, :admin]

  has_many :ideas
  has_many :categories, through: :ideas
end
