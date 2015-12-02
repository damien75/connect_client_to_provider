class AddStatusToProviders < ActiveRecord::Migration
  def change
    add_reference :providers, :status, index: true, foreign_key: true
  end
end
