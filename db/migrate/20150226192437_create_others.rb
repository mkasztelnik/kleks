class CreateOthers < ActiveRecord::Migration
  def change
    create_table :others do |t|
      t.text :title,      null: false

      t.references :user, null: false

      t.timestamps null: false
    end

    add_foreign_key :others, :users, index: true
  end
end
