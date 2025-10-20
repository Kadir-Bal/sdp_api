class ScalesController < ApplicationController
  def index
    @scales = Scale.all
    render json: @scales
  end

  def create
    @scale = Scale.new(scale_params)
    if @scale.save
      render json: @scale, status: :created
    else
      render json: @scale.errors, status: :unprocessable_entity
    end
  end

  private

  def scale_params
    params.require(:scale).permit(:name, :description, :doi)
  end
end
