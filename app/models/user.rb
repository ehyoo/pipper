require 'bcrypt'

class User < ActiveRecord::Base
  has_many :pips
  has_many :favorites
  has_many :favorited_pips, through: :favorites, source: :favorite
  has_secure_password # THIS IS MAGIC.
end
