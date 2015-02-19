class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.text :abstract, null: false

      t.references :user

      t.timestamps null: false
    end

    add_foreign_key :motivations, :users
  end
end
