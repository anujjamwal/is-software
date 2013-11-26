class AddColumnUserIdToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :user_id, :integer
  end
end
