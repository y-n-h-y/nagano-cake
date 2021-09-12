class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :payment
      t.integer :price
      t.integer :postage
      t.integer :status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
