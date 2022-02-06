class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.integer :height, default: 0
      t.integer :weight, default: 0
      t.string :image
      t.integer :experience, default: 0
      t.integer :indicator, default: 0

      t.timestamps
    end
  end
end
