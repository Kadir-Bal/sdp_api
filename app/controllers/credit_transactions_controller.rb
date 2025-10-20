class CreditTransactionsController < ApplicationController
  # GET /credit_transactions
  def index
    @transactions = CreditTransaction.all
    render json: @transactions
  end

  # GET /credit_transactions/:id
  def show
    @transaction = CreditTransaction.find(params[:id])
    render json: @transaction
  end

  # POST /credit_transactions
  def create
    @transaction = CreditTransaction.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:credit_transaction).permit(:user_id, :activity, :credits_used, :balance_after)
  end
end
