class Idea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user
  belongs_to :category
  has_many :idea_images
  has_many :images, through: :idea_images
end
