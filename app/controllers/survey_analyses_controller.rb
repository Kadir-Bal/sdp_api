# app/controllers/survey_analyses_controller.rb
class SurveyAnalysesController < ApplicationController
  def index
    @analyses = SurveyAnalysis.all
    render json: @analyses
  end

  def show
    @analysis = SurveyAnalysis.find(params[:id])
    render json: @analysis
  end

  def create
    @analysis = SurveyAnalysis.new(analysis_params)
    if @analysis.save
      render json: @analysis, status: :created
    else
      render json: @analysis.errors, status: :unprocessable_entity
    end
  end

  private

  def analysis_params
    params.require(:survey_analysis).permit(:survey_id, :average_score, :max_score, :min_score, :total_responses)
  end
end
