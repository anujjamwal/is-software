class RenameColumnUrlInSoftwareToPath < ActiveRecord::Migration
  def change
    rename_column :softwares, :url, :path
  end
end
