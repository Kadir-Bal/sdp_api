class AnalysesController < ApplicationController
  def show
    survey = Survey.find(params[:survey_id])
    responses = survey.responses

    render json: {
      survey_id: survey.id,
      average_score: responses.average(:score),
      max_score: responses.maximum(:score),
      min_score: responses.minimum(:score),
      total_responses: responses.count
    }
  end
end
