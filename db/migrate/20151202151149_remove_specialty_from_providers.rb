class RemoveSpecialtyFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :specialty, :string
  end
end
