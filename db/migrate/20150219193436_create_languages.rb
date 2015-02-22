class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :understanding_level,    null: false
      t.string :speaking_level,         null: false
      t.string :writing_level,          null: false

      t.boolean :native, default: false

      t.boolean :study, default: false
      t.string :study_program
      t.string :study_url

      t.boolean :certificate
      t.string :certificate_name
      t.integer :certificate_year
      t.string :certificate_score

      t.boolean :other
      t.text :other_description

      t.references :user,               null: false

      t.timestamps null: false
    end

    add_foreign_key :languages, :users, index: true
  end
end
