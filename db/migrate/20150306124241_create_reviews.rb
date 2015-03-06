class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, null: false
      t.references :reviewer, null: false

      t.integer :general_score
      t.integer :profile_score
      t.integer :motivation_score
      t.integer :presentation_score
      t.integer :education_score
      t.integer :academic_score
      t.integer :work_score
      t.integer :language_score

      t.timestamps null: false
    end

    add_foreign_key :reviews, :users, index: true
    add_foreign_key :reviews, :users, column: :reviewer_id, index: true
  end
end
