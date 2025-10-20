class CreateCreditTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :credit_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :activity
      t.integer :credits_used
      t.integer :balance_after

      t.timestamps
    end
  end
end
