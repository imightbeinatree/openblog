# User Model
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  def display_name
    return email if first_name.blank? && last_name.blank?
    return first_name if last_name.blank?
    return last_name if first_name.blank?
    "#{first_name} #{last_name}"
  end
end
