require 'bcrypt'

class User < ActiveRecord::Base
  has_many :pips, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_pips, through: :favorites, source: :pip
  has_many :follows, dependent: :destroy
  has_many :followees, through: :follows, class_name: 'User'
  has_secure_password 

  validates :username,
            presence: true,
            format: { with: /\A[\w\d]+\z/ },
            uniqueness: true

  validates :email,
            uniqueness: true,
            presence: true
            # TODO: email validations

  validates :password,
            length: { within: 6..16 },
            allow_nil: true,
            format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).*\z/, 
                      message: 'Password must contain at least one number and letter'} 

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

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
