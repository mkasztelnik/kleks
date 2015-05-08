class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title,    null: false
      t.text :abstract,   null: false
      t.string :keywords, null: false

      t.references :user, null: false

      t.timestamps null: false
    end

    add_foreign_key :presentations, :users, index: true
  end
end
