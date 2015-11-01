class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  has_many :comments, foreign_key: :comment_id
  has_many :post_categories, foreign_key: :post_id
  has_many :categories, through: :post_categories
end