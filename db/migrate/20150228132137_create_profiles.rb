class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :middle_name
      t.date   :date_of_birth,              null: false
      t.string :place_of_birth,             null: false
      t.string :citizenship,                null: false
      t.string :country,                    null: false

      t.boolean :need_visa,                 default: false
      t.string :passport_number
      t.date   :passport_date_of_issue
      t.string :passport_place_of_issue
      t.string :passport_issuing_agency

      t.references :user,                   null: false
      t.references :address,                null: false

      t.timestamps null: false
    end

    add_foreign_key :profiles, :users, index: true
    add_foreign_key :profiles, :addresses, index: true
  end
end