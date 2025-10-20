class AddAmountAndTypeToCreditTransactions < ActiveRecord::Migration[8.0]
  def change
    add_column :credit_transactions, :amount, :integer
    add_column :credit_transactions, :transaction_type, :string
  end
end
