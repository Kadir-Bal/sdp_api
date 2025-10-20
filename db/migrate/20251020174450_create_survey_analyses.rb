class CreateSurveyAnalyses < ActiveRecord::Migration[8.0]
  def change
    create_table :survey_analyses do |t|
      t.references :survey, null: false, foreign_key: true
      t.float :average_score
      t.float :max_score
      t.float :min_score
      t.integer :total_responses

      t.timestamps
    end
  end
end
