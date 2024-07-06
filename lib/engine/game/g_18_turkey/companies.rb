# frozen_string_literal: true

module Engine
  module Game
    module G18Turkey
      module Companies
        COMPANIES = [
        {
          name: 'P1 Bursa Mudanya Railway',
          sym: 'BM',
          value: 20,
          revenue: 5,
          desc: 'No special abilities.',
          abilities: [],
          color: nil,
        },
        {
          name: 'P2 Ottoman Public Debt Administration',
          sym: 'OA',
          value: 30,
          revenue: 5,
          desc: 'No special abilities.',
          abilities: [],
          color: nil,
        },
        {
          name: 'P3  Bank fur Oriental- ische Eisenbahnen',
          sym: 'OE',
          value: 60,
          revenue: 10,
          desc: 'Exchange for a German share',
          abilities: [
            {
              type: 'exchange',
              corporations: %w[OE AE BB],
              owner_type: 'player',
              when: 'any',
              from: %w[ipo market],
            },
          ],
          color: nil,
        },
        {
          name: 'P4 Tancred, Coiseau & Co',
          sym: 'TC',
          value: 80,
          revenue: 15,
          desc: 'No special abilities.',
          abilities: [
            {
              type: 'exchange',
              corporations: %w[MTA DHE],
              owner_type: 'player',
              when: 'any',
              from: %w[ipo market],
            },
          ],
          color: nil,
        },
        {
          name: 'P5 Baku-Batumi Railway',
          sym: 'BB',
          value: 140,
          revenue: 20,
          desc: 'No special abilities.',
          abilities: [
            { type: 'close', on_phase: '3' },
            { type: 'no_buy' },
            { type: 'shares', shares: 'TR_0' },
          ],
          color: nil,
        },
        {
          name: 'P6 The Izmir-Aydin Concession',
          sym: 'IA',
          value: 180,
          revenue: 30,
          desc: 'No special abilities.',
          abilities: [
            { type: 'close',  on_phase: '3' },
            { type: 'no_buy' },
            { type: 'shares', shares: 'ORC_0' },
          ],
          color: nil,
        },
        ].freeze
      end
    end
  end
end
