class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
