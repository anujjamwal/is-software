class AddColumnDownloadCountToAllocation < ActiveRecord::Migration
  def change
    add_column :allocations, :download_count, :integer
  end
end
