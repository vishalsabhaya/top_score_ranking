# frozen_string_literal: true

require 'rails_helper'

describe Players::ProfileInfo do
  let(:params) { { id: player.id } }
  let(:service) { described_class.new(params) }
  let(:player) { create(:player) }

  before do
    4.times do |n|
      create(:score, player: player, score_point: n + 1, score_at: DateTime.now + 1.day)
    end
  end

  context 'with validations' do
    it 'check presence of id' do
      service.id = nil
      service.valid?
      expect(service.errors[:id]).to include(/can't be blank/)
    end

    it 'check id is greater than 0' do
      service.id = 0
      service.valid?
      expect(service.errors[:id]).to include('must be greater than 0')
    end
  end

  describe '#call' do
    it 'returns a player record' do
      response = service.call
      expect(response).to be_a(Player)
      expect(response).to eq(player)
    end

    context 'when player does not exist' do
      it 'raises ActiveRecord::RecordNotFound' do
        service.id = player.id + 1_000_000
        expect { service.call }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

end
