class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :company
      t.string :status
      t.string :specialty
      t.datetime :added_to_db_date

      t.timestamps null: false
    end
  end
end
