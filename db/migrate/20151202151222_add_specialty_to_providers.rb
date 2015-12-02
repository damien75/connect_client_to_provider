class AddSpecialtyToProviders < ActiveRecord::Migration
  def change
    add_reference :providers, :specialty, index: true, foreign_key: true
  end
end
