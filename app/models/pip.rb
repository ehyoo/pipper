class Pip < ActiveRecord::Base  
  belongs_to :user
  has_many :favorites

  validates_length_of :body, maximum: 140
  validates_presence_of :body, :user_id

  def body=(value)
    # no trailing white space in pips.
    write_attribute(:body, value.strip)
  end
end
