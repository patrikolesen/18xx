# frozen_string_literal: true

module Engine
  module Game
    module G18Turkey
      module Trains
        TRAINS = [
          {
            name: '2',
            distance: 2,
            price: 80,
            rusts_on: '4',
            num: 6,
            status: %w[kilometric_guarantee_active],
          },
          {
            name: '3',
            distance: 3,
            price: 180,
            rusts_on: '6',
            num: 5,
            status: %w[can_buy_companies],
          },
          {
            name: '4',
            distance: 4,
            price: 300,
            rusts_on: 'D',
            num: 4,
          },
          {
            name: '5',
            distance: 5,
            price: 440,
            num: 3,
            events: [{ 'type' => 'close_companies' }],
          },
          {
            name: '6',
            distance: 6,
            price: 620,
            num: 2,
            events: [{ 'type' => 'nationalization', 'when' => 2 }],
          },
          {
            name: 'D',
            distance: 999,
            price: 1100,
            num: 20,
            discount: { '4' => 300, '5' => 300, '6' => 300 },
          },
        ].freeze
      end
    end
  end
end
