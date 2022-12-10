class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :score
  
  validates :comment, presence: true
end
