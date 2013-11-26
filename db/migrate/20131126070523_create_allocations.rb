class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.integer :software_id
      t.integer :user_id
      t.timestamp :valid_upto
      t.string :hash_code
      t.integer :allocator_id

      t.timestamps
    end
  end
end
