class CreateSurveyAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :survey_assignments do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :participant, null: false, foreign_key: true
      t.datetime :assigned_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
