class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.string :address_id
      t.string :fee

      t.timestamps
    end
  end
end
