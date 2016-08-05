require 'bcrypt'

class User < ActiveRecord::Base
  has_many :pips, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_pips, through: :favorites, source: :pip
  has_many :follows, dependent: :destroy
  has_many :followees, through: :follows, class_name: 'User'
  has_secure_password 

  validates_presence_of :username, :password
  validates_uniqueness_of :username
  validates_length_of :username, within: 4..16
  validates_format_of :username, with: /\A[\w\d]+\z/
  validates_length_of :password, within: 7..16
  validates_format_of :password,
                      with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).*\z/, 
                      message: 'Password must contain at least one number and letter!'

  def followers
  	User.find(Follow.where(followee_id: self.id).pluck(:user_id))
  end

  def pips_of_self_and_following
    # Lists all the pips that the current user has written as well as 
    # the pips that the followees have written
    full_list = self.pips + Pip.where(user_id: self.followees.pluck(:id))
    full_list.sort_by(&:created_at)
  end

  def follow(followee_id)
    Follow.new(user_id: self.id, followee_id: followee_id.to_i).save
  end
end
