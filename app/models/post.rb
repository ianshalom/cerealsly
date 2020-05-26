class Post < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 50}
  validates :body, length: { maximum: 100}, presence: true
end