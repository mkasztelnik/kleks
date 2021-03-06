class CreateMotivations < ActiveRecord::Migration
  def change
    create_table :motivations do |t|
      t.text :text,       null: false

      t.references :user, null: false

      t.timestamps null: false
    end

    add_foreign_key :motivations, :users, index: true
  end
end
