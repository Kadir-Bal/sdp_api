class CreateResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :responses do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :participant, null: false, foreign_key: true
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
