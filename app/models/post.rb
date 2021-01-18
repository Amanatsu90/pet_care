class Post < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :teme

  with_options presence: true do
    validates :title
    validates :text
  end

  validates :text, numericality: { other_than: 0 } 
end
