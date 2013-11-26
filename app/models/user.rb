class User < ActiveRecord::Base
  validates :emp_id, presence: true

  def admin?
    self.role.downcase == 'admin'
  end
end
