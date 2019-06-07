class CreatePools < ActiveRecord::Migration[5.2]
  def change
    create_table :pools do  |t| 
      t.string :pool_desc 
      t.integer :user_id
      t.string :pool_name 
      t.string :building_name 
      t.string :address 
      t.datetime :pool_open 
      t.datetime :pool_close 
      t.boolean :has_happy_hour 
      t.datetime :hh_open 
      t.datetime :hh_close 
      t.boolean :has_food
      t.string :website
    end
  end
end
