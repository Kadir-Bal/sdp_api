class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
    render json: @surveys
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      render json: @survey, status: :created
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description, :scale_id)
  end
end
