class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.integer :allocation_id
      t.integer :user_id
      t.integer :software_id
      t.string :ip
      t.string :user_agent

      t.timestamps
    end
  end
end
