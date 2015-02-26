class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.text   :title,              null: false
      t.text   :address,            null: false
      t.string :conference_name,    null: false
      t.string :presentation_type,  null: false
      t.date   :start_date,         null: false
      t.date   :end_date,           null: false

      t.references :user,           null: false

      t.timestamps null: false
    end

    add_foreign_key :conferences, :users, index: true
  end
end
