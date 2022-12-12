class Mylist < ApplicationRecord
  belongs_to :user
  has_many :mylist_scores, dependent: :destroy
  has_many :items, through: :mylist_scores
end
