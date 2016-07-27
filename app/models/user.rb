require 'bcrypt'

class User < ActiveRecord::Base
  has_many :pips
  has_many :favorites
  has_many :favorited_pips, through: :favorites, source: :pip

  has_many :follows
  has_many :followees, through: :follows, class_name: 'User'
  has_secure_password # THIS IS MAGIC.
  
  def followers
  	# get all users where the followed_id is 
  	User.find(Follow.where(followee_id: self.id).pluck(:user_id))
  end
end
