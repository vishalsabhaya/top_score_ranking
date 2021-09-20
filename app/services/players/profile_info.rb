# frozen_string_literal: true

module Players
  class ProfileInfo
    include ActiveModel::Model

    attr_accessor :id # Int

    validates :id, presence: true, numericality: { greater_than: 0 }

    def call
      @call ||= Player.includes(:scores).order('scores.score_point DESC').find(id)
    end

    def top_score
      call.scores.select("max(score_point) score_point")[0]["score_point"]
    end

    def top_score_at
      call.scores.where(score_point: top_score)&.first&.score_at
    end

    def low_score
      call.scores.select("min(score_point) score_point")[0]["score_point"]
    end

    def low_score_at
      call.scores.where(score_point: low_score)&.first&.score_at
    end

    def avg_score
      call.scores.average(:score_point).round(2)
    end
  end
end
