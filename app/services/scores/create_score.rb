# frozen_string_literal: true

module Scores
  class CreateScore
    include ActiveModel::Model

    attr_accessor :name, :score_point, :score_at

    validates :name, presence: true
    validates :score_point, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :score_at, presence: true, iso8601: true

    def call
      valid? && create_player_score
    end

    private

    def create_player_score
      player.scores.create!(score_point: score_point, score_at: score_at)
    end

    def player
      @player = Player.find_or_create_by(name: name)
    end
  end
end
