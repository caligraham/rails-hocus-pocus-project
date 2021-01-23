class AddDescriptionToSpells < ActiveRecord::Migration[6.1]
  def change
    add_column :spells, :description, :text
  end
end
