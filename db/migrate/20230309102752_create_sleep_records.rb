class CreateSleepRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :sleep_records do |t|
      t.belongs_to :user
      t.datetime :clock_in
      t.datetime :clock_out
      t.decimal :sleep_length
      t.timestamps
    end
  end
end
