class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :scores
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  
  def active_for_authentication?
    super && (status == false)
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
