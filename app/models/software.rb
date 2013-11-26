class Software < ActiveRecord::Base
  belongs_to :state
  belongs_to :operating_system
  belongs_to :user

  has_many :allocations
end
