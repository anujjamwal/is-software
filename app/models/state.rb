class State < ActiveRecord::Base
  def self.active
    where(name: 'Active').first_or_create
  end

  def self.inactive
    where(name: 'Inactive').first_or_create
  end
end
