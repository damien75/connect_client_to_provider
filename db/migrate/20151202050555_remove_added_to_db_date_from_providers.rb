class RemoveAddedToDbDateFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :added_to_db_date, :datetime
  end
end
