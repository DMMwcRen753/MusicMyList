class Score < ApplicationRecord
  belongs_to :user #一人の会員が複数の投稿を持つ
  has_many :comments, dependent: :destroy#一つの投稿に複数のコメントが付く
  has_many :favorites, dependent: :destroy#一つの投稿に複数のいいねが付く
  belongs_to :categories　#一つのカテゴリが複数の投稿を持つ
  
  validates :name,presence:true #タイトルが無ければ投稿、編集ができない
  validates :artist,presence:true #アーティスト名が無ければ投稿、編集ができない
  validates :date,presence:true #ファイルが無ければ投稿、編集ができない
  
  has_one_attached :file
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def get_file(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpeg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
end
