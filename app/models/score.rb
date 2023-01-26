class Score < ApplicationRecord
  belongs_to :user, optional: true #一人の会員が複数の投稿を持つ
  has_many :comments, dependent: :destroy#一つの投稿に複数のコメントが付く
  has_many :favorites, dependent: :destroy#一つの投稿に複数のいいねが付く
  belongs_to :category #一つのカテゴリが複数の投稿を持つ
  has_many :score_lists, dependent: :destroy

  validates :name, presence:true #タイトルが無ければ投稿、編集ができない
  validates :artist, presence:true #アーティスト名が無ければ投稿、編集ができない

  validates :images, presence:true #ファイルが無ければ投稿、編集ができない
  validates :category_id, presence: true #カテゴリーが無ければ投稿、編集ができない

  has_many_attached :images

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def get_image(image, width, height)
    unless images.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpeg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
  
  ransacker :favorite_count do
    query = <<-SQL
    (
      SELECT
      COUNT(favorites.score_id)
      FROM
        favorites
      WHERE
        favorites.score_id = scores.id
      GROUP BY
        favorites.score_id
    )
    SQL
    Arel.sql(query)
  end
end
