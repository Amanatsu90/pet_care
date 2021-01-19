class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :theme

  with_options presence: true do
    validates :title
    validates :text
    validates :dog_size_id
  end

  validates :theme_id, numericality: { other_than: 0, message: 'を選択してください' }
end
