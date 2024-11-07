class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
