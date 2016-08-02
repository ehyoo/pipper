require 'bcrypt'

class User < ActiveRecord::Base
  has_many :pips
  has_many :favorites
  has_many :favorited_pips, through: :favorites, source: :pip

  has_many :follows
  has_many :followees, through: :follows, class_name: 'User'
  has_secure_password 
  
  def followers
  	User.find(Follow.where(followee_id: self.id).pluck(:user_id))
  end
end
