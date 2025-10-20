class CreateScales < ActiveRecord::Migration[8.0]
  def change
    create_table :scales do |t|
      t.string :name
      t.text :description
      t.string :doi

      t.timestamps
    end
  end
end
