class Interest < ActiveRecord::Base
  attr_accessible :performer_id, :user_id

  belongs_to :user
  belongs_to :performer
end
