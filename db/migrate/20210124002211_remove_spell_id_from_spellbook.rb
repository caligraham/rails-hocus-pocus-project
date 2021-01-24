class RemoveSpellIdFromSpellbook < ActiveRecord::Migration[6.1]
  def change
    remove_column :spellbooks, :spell_id
  end
end
