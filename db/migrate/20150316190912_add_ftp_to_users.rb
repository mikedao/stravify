class AddFtpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ftp, :integer
    add_column :users, :hours_ridden, :integer
    add_column :users, :miles_ridden, :integer
  end
end
