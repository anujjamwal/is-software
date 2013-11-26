class CreateOperatingSystems < ActiveRecord::Migration
  def change
    create_table :operating_systems do |t|
      t.string :name
      t.decimal :version
      t.integer :state_id

      t.timestamps
    end
  end
end
