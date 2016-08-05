class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :followee, class_name: 'User'

  validates_uniqueness_of :user_id, scope: :followee_id,
                          message: 'Can only follow a user once'
end
