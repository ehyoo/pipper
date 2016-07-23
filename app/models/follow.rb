class Follow < ActiveRecord::Base
  belongs_to :follower, source: :user
  belongs_to :followee, source: :user
end
