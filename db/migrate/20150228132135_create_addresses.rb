class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :postcode, null: false

      t.timestamps null: false
    end
  end
end
