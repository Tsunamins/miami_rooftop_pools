class ChangeDatatypeForHours < ActiveRecord::Migration[5.2]
  def change
    change_column :pools, :pool_open, :time
    change_column :pools, :pool_close, :time
    change_column :pools, :hh_open, :time
    change_column :pools, :hh_close, :time
  end
end
