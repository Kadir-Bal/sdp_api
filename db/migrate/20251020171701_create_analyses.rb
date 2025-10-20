class CreateAnalyses < ActiveRecord::Migration[8.0]
  def change
    create_table :analyses do |t|
      t.references :survey, null: false, foreign_key: true
      t.float :average_score
      t.integer :max_score
      t.integer :min_score

      t.timestamps
    end
  end
end
