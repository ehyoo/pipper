require 'bcrypt'

class User < ActiveRecord::Base
  # Relationships 
  has_many :pips
  has_many :favorites
  has_many :favorited_pips, through: :favorites, source: :pip
  has_many :follows
  has_many :followees, through: :follows, class_name: 'User'
  has_secure_password 

  # Validations
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  validates_length_of :username, within: 4..16
  validates_format_of :username, with: /\A[\w\d]+\z/
  validates_length_of :password, within: 7..16
  validates_format_of :password, with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).*\z/, message: 'Password must contain at least one number and letter!'

  def followers
  	User.find(Follow.where(followee_id: self.id).pluck(:user_id))
  end

  def pips_of_self_and_following
    full_list = self.pips + Pip.where(user_id: self.followees.pluck(:id))
    full_list.sort_by(&:created_at)
  end
end
