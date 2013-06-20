class Interest < ActiveRecord::Base
  attr_accessible :performer_id, :user_id
  attr_accessor :from_friend

  belongs_to :user
  belongs_to :performer

end
