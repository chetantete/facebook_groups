class Group < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :keywords
end
