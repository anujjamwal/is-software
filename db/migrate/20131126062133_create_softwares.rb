class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name
      t.string :url
      t.integer :operating_system_id
      t.text :description
      t.integer :download_count
      t.integer :state_id

      t.timestamps
    end
  end
end
