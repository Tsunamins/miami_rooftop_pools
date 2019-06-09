class ChangeDataTypeForHoursAgain < ActiveRecord::Migration[5.2]
  def change
    
      change_column :pools, :pool_open, :integer
      change_column :pools, :pool_close, :integer
      change_column :pools, :hh_open, :integer
      change_column :pools, :hh_close, :integer
    
  end
end
