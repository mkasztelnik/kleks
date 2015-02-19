class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :understanding_level
      t.string :speaking_level
      t.string :writing_level

      t.boolean :native, default: false

      t.boolean :study, default: false
      t.string :study_program
      t.string :study_url

      t.boolean :certificate
      t.string :certificate_name
      t.integer :certificate_year
      t.string :cettificate_score

      t.boolean :other
      t.text :other_description

      t.references :user

      t.timestamps null: false
    end

    add_foreign_key :languages, :users
  end
end
