class Software < ActiveRecord::Base
  belongs_to :state
  belongs_to :operating_system
  belongs_to :user

  has_many :allocations

  before_create :setup_defaults

  private
  def setup_defaults
    self.state ||= State.active
    self.download_count ||= 0
  end
end
