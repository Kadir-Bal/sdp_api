class ResponsesController < ApplicationController
  def index
    render json: Response.all
  end

  def create
    response = Response.new(response_params)
    if response.save
      render json: response, status: :created
    else
      render json: response.errors, status: :unprocessable_entity
    end
  end

  private

  def response_params
    params.require(:response).permit(:survey_id, :participant_id, :score, :comment)
  end
end
