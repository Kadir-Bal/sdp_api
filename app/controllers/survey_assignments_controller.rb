class SurveyAssignmentsController < ApplicationController
  # GET /survey_assignments
  def index
    @assignments = SurveyAssignment.all
    render json: @assignments
  end

  # GET /survey_assignments/:id
  def show
    @assignment = SurveyAssignment.find(params[:id])
    render json: @assignment
  end

  # POST /survey_assignments
  def create
    @assignment = SurveyAssignment.new(assignment_params)
    if @assignment.save
      render json: @assignment, status: :created
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  private

  def assignment_params
    params.require(:survey_assignment).permit(:survey_id, :participant_id, :assigned_at, :completed_at)
  end
end
