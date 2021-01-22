class CreateSpellbooks < ActiveRecord::Migration[6.1]
  def change
    create_table :spellbooks do |t|
      t.string :title
      t.string :category
      t.integer :level
      t.integer :user_id
      t.integer :spell_id

      t.timestamps
    end
  end
end
