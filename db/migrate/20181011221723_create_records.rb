class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.date :record_date
      t.decimal :duration_of_work
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
    add_index :records, :project_id
  end
end
