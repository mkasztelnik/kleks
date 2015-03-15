class AddEditorToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :editors, :string
  end
end
