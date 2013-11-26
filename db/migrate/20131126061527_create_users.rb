class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :emp_id

      t.timestamps
    end
  end
end
