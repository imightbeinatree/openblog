# Post Model
class Post < ActiveRecord::Base
  belongs_to :author, foreign_key: 'user_id', class_name: User
  has_many :comments

  validates :author, presence: true
  validates :title, presence: true
  validates :body, presence: true

  scope :latest, -> { order('created_at desc') }

  paginates_per 5
  max_paginates_per 50
end
