class Post < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :theme

  with_options presence: true do
    validates :title
    validates :text
  end

  validates :theme_id, numericality: { other_than: 0 } 
end
