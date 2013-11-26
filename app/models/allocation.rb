class Allocation < ActiveRecord::Base
  belongs_to :user
  belongs_to :software
  belongs_to :allocator, class_name: User

  before_create :build_download_url_hash, :set_valid_upto, :setup_defaults

  def alive?(user)
    self.valid_upto > Time.now && self.user_id == user.id
  end

  private
  def build_download_url_hash
    self.hash_code ||= "#{self.software.name.snake_case}_#{self.user.emp_id}_#{Time.now.to_i}"
  end

  def set_valid_upto
    self.valid_upto ||= 2.hours.since
  end

  def setup_defaults
    self.download_count ||= 0
  end
end
