class CreateScaleVersions < ActiveRecord::Migration[8.0]
  def change
    create_table :scale_versions do |t|
      t.references :scale, null: false, foreign_key: true
      t.integer :version_number
      t.text :change_log

      t.timestamps
    end
  end
end
