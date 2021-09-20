# frozen_string_literal: true

module Scores
  class ListScore
    include Searchable

    search_from model: Score, serializer: ScoreSerializer

    attr_accessor :to_score_date, # Date
                  :from_score_date, # Date
                  :name, # String,
                  :limit, # Int
                  :offset # Int

    validates :to_score_date, date_format: true, if: -> { to_score_date.present? }
    validates :from_score_date, date_format: true, if: -> { from_score_date.present? }
    validates :limit, numericality: { greater_than: 0 }
    validates :offset, numericality: { greater_than_or_equal_to: 0 }

    def call
      perform_search do |_score|
        filter_by('players.name', name, multi_player: true)
        filter_by(:score_at, score_at)
      end
    end

    def includes
      'player'
    end

    private

    # Filter
    def filter_by(attr, value, multi_player: false)
      return @query if value.blank?

      value = value.to_s.split(',') if multi_player
      @query = query.where(attr => value)
    end

    def score_at
      if to_score_date.present? && from_score_date.present?
        [from_score_date.to_datetime..to_score_date.to_datetime]
      elsif to_score_date.present?
        [..to_score_date.to_datetime]
      elsif from_score_date.present?
        [from_score_date.to_datetime..]
      end
    end
  end
end
