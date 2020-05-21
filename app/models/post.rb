class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 20}
  validates :body, length: { maximum: 100}, presence: true
end