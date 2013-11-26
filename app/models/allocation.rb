class Allocation < ActiveRecord::Base
  belongs_to :user
  belongs_to :software
  belongs_to :allocator, class_name: User

  before_save :build_download_url_hash
  before_save :set_valid_upto

  private
  def build_download_url_hash
    self.hash_code = "#{self.software.name.snake_case}_#{self.user.emp_id}_#{Time.now.to_i}"
  end

  def set_valid_upto
    self.valid_upto = 2.hours.since
  end
end
