class RemoveUserIdFromSpellbooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :spellbooks, :user_id
end
end
