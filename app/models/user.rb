require 'bcrypt'

class User < ActiveRecord::Base
  has_many :pips
  has_secure_password # THIS IS MAGIC.
end
