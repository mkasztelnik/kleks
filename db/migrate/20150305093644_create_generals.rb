class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.boolean :accept

      t.references :user, null: false

      t.timestamps null: false
    end

    add_foreign_key :generals, :users, index: true
  end
end
