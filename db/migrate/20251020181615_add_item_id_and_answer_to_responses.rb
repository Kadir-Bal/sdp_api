class AddItemIdAndAnswerToResponses < ActiveRecord::Migration[8.0]
  def change
    add_reference :responses, :item, null: false, foreign_key: true
    add_column :responses, :answer, :string
  end
end
