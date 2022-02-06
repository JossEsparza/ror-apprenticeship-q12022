class CreateSpriteSets < ActiveRecord::Migration[7.0]
  def change
    create_table :sprite_sets do |t|
      t.integer :sprites_on_id
      t.string :sprites_on_type
      t.string :back_default
      t.string :back_female
      t.string :back_shiny
      t.string :back_shiny_female
      t.string :front_default
      t.string :front_female
      t.string :front_shiny
      t.string :front_shiny_female

      t.timestamps
    end
    add_index :sprite_sets, [:sprites_on_id, :sprites_on_type]
  end
end
