class Post < ApplicationRecord
  acts_as_taggable

  belongs_to       :user
  has_many         :comments
  has_many         :favorites
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :theme

  with_options presence: true do
    validates :title
    validates :text
    validates :dog_size_id
  end

  validates :theme_id, numericality: { other_than: 0, message: 'を選択してください' }

  def self.search(search)
    if search != ''
      Post.where('text LIKE(?)', "%#{search}%").or(Post.where('title LIKE(?)', "%#{search}%"))
    else
      Post.all
    end
  end

end
