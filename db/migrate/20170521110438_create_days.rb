class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.string :state
      t.string :transportation
      t.string :day

      t.timestamps
    end
  end
end
