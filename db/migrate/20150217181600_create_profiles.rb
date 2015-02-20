class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :middle_name,                null: false
      t.date   :date_of_birth,              null: false
      t.string :place_of_birth,             null: false
      t.string :citizenship,                null: false
      t.string :passport_number,            null: false
      t.date   :passport_date_of_issue,     null: false
      t.string :passport_place_of_issue,    null: false
      t.string :passport_issuing_agency,    null: false
      t.string :country,                    null: false

      t.references :user,                   null: false

      t.timestamps null: false
    end

    add_foreign_key :profiles, :users, index: true
  end
end