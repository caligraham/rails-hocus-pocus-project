class CreateCrystalBalls < ActiveRecord::Migration[6.1]
  def change
    create_table :crystal_balls do |t|
      t.string :type
      t.integer :sorcery_score
      t.string :size
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
