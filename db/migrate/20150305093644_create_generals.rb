class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.boolean :accept, default: false
      t.boolean :accept_travel, default: false
      t.boolean :accept_insurance, default: false

      t.boolean :know_from_ces_www, default: false
      t.boolean :know_from_ces_facebook, default: false
      t.boolean :know_from_facebook, default: false
      t.boolean :know_from_newsletter, default: false
      t.text :other_websites
      t.boolean :know_from_leaflet, default: false
      t.boolean :know_from_friends, default: false
      t.text :other

      t.references :user, null: false

      t.timestamps null: false
    end

    add_foreign_key :generals, :users, index: true
  end
end
