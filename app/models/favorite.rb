class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :pip

  validates_uniqueness_of :user_id, scope: :pip_id, 
                          message: 'Can only favorite a pip once'
end
