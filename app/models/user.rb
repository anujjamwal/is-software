class User < ActiveRecord::Base
  validates :emp_id, presence: true
  has_many :downloads 

  def admin?
    self.role.downcase == 'admin'
  end
end
