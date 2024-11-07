class AddPercentageToCoupons < ActiveRecord::Migration[6.1]
  def change
    add_column :coupons, :percentage, :decimal
  end
end
