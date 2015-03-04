class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :country
      t.string :profile
      t.string :email
      t.integer :uid
      t.string :token
      t.string :sex

      t.timestamps null: false
    end
  end
end
