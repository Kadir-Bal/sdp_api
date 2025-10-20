class AddAuthorToScales < ActiveRecord::Migration[8.0]
  def change
    add_reference :scales, :author, null: false, foreign_key: { to_table: :users }
  end
end

