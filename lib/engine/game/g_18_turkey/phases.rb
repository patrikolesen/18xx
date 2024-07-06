# frozen_string_literal: true

module Engine
  module Game
    module G18Turkey
      module Phases
        PHASES = [
          {
            name: '2',
            train_limit: 3,
            tiles: [:yellow],
            operating_rounds: 1,
            status: %w[kilometric_guarantee_active],
          },
          {
            name: '3',
            on: '3',
            train_limit: 3,
            tiles: %i[yellow green],
            operating_rounds: 2,
            status: %w[kilometric_guarantee_active can_buy_companies],
          },
          {
            name: '4',
            on: '4',
            train_limit: 3,
            tiles: %i[yellow green],
            operating_rounds: 2,
            status: %w[can_buy_companies wwi],
          },
          {
            name: '5',
            on: '5',
            train_limit: 2,
            tiles: %i[yellow green brown],
            operating_rounds: 3,
            status: %w[nationalization],
            events: [{ 'type' => 'close_companies' }],
          },
          {
            name: '6',
            on: '6',
            train_limit: 2,
            tiles: %i[yellow green brown],
            operating_rounds: 3,
            status: %w[tcdd_allowed],
          },
          {
            name: 'D',
            on: 'D',
            train_limit: 2,
            tiles: %i[yellow green brown gray],
            operating_rounds: 3,
          },
        ].freeze
      end
    end
  end
end
