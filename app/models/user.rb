class User < ApplicationRecord
  has_secure_password

  enum role:[:default, :admin]

  has_many :ideas
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
