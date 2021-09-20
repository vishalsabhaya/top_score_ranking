# frozen_string_literal: true

module Api
  class ScoresController < ApplicationController
    before_action :set_score, only: %i[show destroy]

    def index
    end

    def show
      render json: @score, include: [:player]
    end

    def create
      service = Scores::CreateScore.new(create_params)
      score = service.call

      if score
        render json: score, include: [:player]
      else
        render ModelInvalidError.to_response(service)
      end
    end

    def destroy
      @score.destroy!
      head :ok
    end

    private

    def create_params
      params.require(:score).permit(:name, :score_point, :score_at)
    end

    def set_score
      @score = Score.find(params[:id])
    end
  end
end
