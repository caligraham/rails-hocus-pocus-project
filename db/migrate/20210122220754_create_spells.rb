class CreateSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :category
      t.integer :level
      t.integer :user_id
      t.integer :spellbook_id

      t.timestamps
    end
  end
end
