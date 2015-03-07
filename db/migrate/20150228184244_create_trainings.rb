class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :title
      t.string :institution, null: false
      t.text :gained_experience, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :country, null: false

      t.references :user, null: false

      t.timestamps null: false
    end

    add_foreign_key :trainings, :users, index: true
  end
end
