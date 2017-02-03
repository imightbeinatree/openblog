# Comment Model
class Comment < ActiveRecord::Base
  belongs_to :author, foreign_key: 'user_id', class_name: User
  belongs_to :post

  validates :author, presence: true
  validates :post, presence: true
  validates :body, presence: true

  scope :latest, -> { order('created_at desc') }
end
