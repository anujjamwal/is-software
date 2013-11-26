class Software < ActiveRecord::Base
  belongs_to :state
  belongs_to :operating_system
  belongs_to :user

  has_many :allocations
  has_many :downloads

  before_create :setup_defaults
  after_create :setup_default_allocation

  def freeware?
    self.freeware
  end

  def download_hash
    self.allocations.first.hash_code if freeware?
  end

  private
  def setup_defaults
    self.state ||= State.active
    self.download_count ||= 0
  end
  
  def setup_default_allocation
    self.allocations.create
  end
end
