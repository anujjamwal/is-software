class AddColumnFreewareToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :freeware, :boolean
  end
end
