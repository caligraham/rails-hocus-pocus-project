class RemoveCategoryFromSpells < ActiveRecord::Migration[6.1]
  def change
    remove_column :spells, :category, :string
  end
end
