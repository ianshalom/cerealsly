class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 20}
  validates :body, presence: true, length: { minimum: 5, maximum: 100}
end