class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :miles_ridden, :distance_ridden
    rename_column :users, :hours_ridden, :time_ridden
  end
end
