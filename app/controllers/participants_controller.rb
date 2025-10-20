class ParticipantsController < ApplicationController
  def index
    render json: Participant.all
  end

  def create
    participant = Participant.new(participant_params)
    if participant.save
      render json: participant, status: :created
    else
      render json: participant.errors, status: :unprocessable_entity
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email)
  end
end
