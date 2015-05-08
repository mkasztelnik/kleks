class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :institution,      null: false
      t.text :responsibility,     null: false
      t.string :country,          null: false
      t.date :start_date,         null: false
      t.date :end_date

      t.references :user,         null: false

      t.timestamps null: false
    end

    add_foreign_key :works, :users, index: true
  end
end
