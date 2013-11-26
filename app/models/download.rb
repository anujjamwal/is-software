class Download < ActiveRecord::Base
  belongs_to :allocation
  belongs_to :user
  belongs_to :software
end
