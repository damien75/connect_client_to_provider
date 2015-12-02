class ChangeCompanyColumnName < ActiveRecord::Migration
  def change
    rename_column :providers, :company, :name
  end
end
