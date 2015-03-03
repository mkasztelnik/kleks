class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.text :title
      t.text :publication_title,  null: false
      t.string :authors,          null: false
      t.integer :year,            null: false
      t.string :language
      t.string :publisher

      t.references :user,         null: false

      t.timestamps null: false
    end

    add_foreign_key :publications, :users, index: true
  end
end
