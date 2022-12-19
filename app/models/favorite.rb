class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :score
  
  validates_uniqueness_of :score_id, scope: :user_id
end
