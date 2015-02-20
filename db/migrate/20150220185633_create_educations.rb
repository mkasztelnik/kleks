class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :education_type,   null: false
      t.date :start_date,         null: false
      t.date :end_date,           null: false
      t.string :university_name,  null: false
      t.string :program_name,     null: false
      t.string :country,          null: false

      t.references :user,         null: false

      t.timestamps null: false
    end

    add_foreign_key :educations, :users, index: true
  end
end
