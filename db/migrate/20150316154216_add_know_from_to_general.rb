class AddKnowFromToGeneral < ActiveRecord::Migration
  def change
    add_column :generals, :know_from_arena, :boolean, default: false
    add_column :generals, :know_from_nee_website, :boolean, default: false
  end
end
