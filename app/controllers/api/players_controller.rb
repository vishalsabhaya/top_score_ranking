# frozen_string_literal: true

module Api
  class PlayersController < ApplicationController
    def show
      service = Players::ProfileInfo.new(id: params[:id])
      if service.valid?
        player = service.call
        render json: {
                        list: player.as_json(only: %i[id name]),
                        top_score: service.top_score,
                        top_score_at: service.top_score_at,
                        low_score: service.low_score,
                        low_score_at: service.low_score_at,
                        avg_score: service.avg_score }
      else
        render ModelInvalidError.to_response(service)
      end
    end
  end
end
