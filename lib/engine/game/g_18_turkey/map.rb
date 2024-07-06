# frozen_string_literal: true

module Engine
  module Game
    module G18Turkey
      module Map
        LAYOUT = :flat
        TILES = {
          '1' => 1,
          '2' => 1,
          '5' => 2,
          '6' => 2,
          '7' => 4,
          '8' => 7,
          '55' => 1,
          '56' => 1,
          '57' => 2,
          '69' => 1,
          '630' => 1,
          '631' => 1,
          '632' => 1,
          '633' => 1,

          'OO1' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'label=OO;city=revenue:30;city=revenue:30;path=a:0,b:_0;path=a:3,b:_0;path=a:2,b:_1;path=a:5,b:_1',
          },
          'OO2' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'label=OO;city=revenue:30;city=revenue:30;path=a:1,b:_0;path=a:3,b:_0;path=a:0,b:_1;path=a:4,b:_1',
          },
          'OO3' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'label=OO;city=revenue:30;city=revenue:30;path=a:3,b:_0;path=a:5,b:_0;path=a:0,b:_1;path=a:4,b:_1',
          },
          'OO4' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'label=OO;city=revenue:30;city=revenue:30;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_1;path=a:4,b:_1',
          },
          'OO5' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'label=OO;city=revenue:30;city=revenue:30;path=a:0,b:_0;path=a:5,b:_0;path=a:3,b:_1;path=a:4,b:_1',
          },
          'T1' => {
            'count' => 8,
            'color' => 'yellow',
            'code' => 'label=T;town=revenue:10;path=a:0,b:_0;path=a:3,b:_0',
          },
          'T2' => {
            'count' => 8,
            'color' => 'yellow',
            'code' => 'label=T;town=revenue:10;path=a:0,b:_0;path=a:2,b:_0',
          },
          'T3' => {
            'count' => 8,
            'color' => 'yellow',
            'code' => 'label=T;town=revenue:10;path=a:0,b:_0;path=a:1,b:_0',
          },
          'TA1' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'label=A;city=revenue:30;path=a:0,b:_0;path=a:3,b:_0',
          },
          'TA2' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'label=A;city=revenue:30;path=a:0,b:_0;path=a:2,b:_0',
          },
          'TA3' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'label=A;city=revenue:30;path=a:0,b:_0;path=a:1,b:_0',
          },
          'CO1' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'label=C;city=revenue:30;city=revenue:30;border=edge:2,type:water;path=a:0,b:_0'\
                      ';path=a:5,b:_1;path=a:2,b:_0,track:narrow',
          },

          '14' => 3,
          '15' => 3,
          'OO6' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'label=OO;city=revenue:40,slots:2;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0',
          },
          'OO7' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'label=OO;city=revenue:40,slots:2;path=a:0,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
          },
          'T4' => {
            'count' => 3,
            'color' => 'green',
            'code' => 'label=T;city=revenue:30;path=a:0,b:_0;path=a:3,b:_0',
          },
          'T5' => {
            'count' => 3,
            'color' => 'green',
            'code' => 'label=T;city=revenue:30;path=a:0,b:_0;path=a:2,b:_0',
          },
          'T6' => {
            'count' => 3,
            'color' => 'green',
            'code' => 'label=T;city=revenue:30;path=a:0,b:_0;path=a:1,b:_0',
          },
          'T10' => {
            'count' => 5,
            'color' => 'green',
            'code' => 'label=T;junction;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0',
          },
          'T11' => {
            'count' => 5,
            'color' => 'green',
            'code' => 'label=T;junction;path=a:0,b:_0;path=a:1,b:_0;path=a:4,b:_0',
          },
          'T12' => {
            'count' => 3,
            'color' => 'green',
            'code' => 'label=T;junction;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0',
          },
          'T18' => {
            'count' => 5,
            'color' => 'green',
            'code' => 'label=T;junction;path=a:0,b:_0;path=a:2,b:_0;path=a:4,b:_0',
          },
          'TA4' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'label=A;city=revenue:60,slots:2;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0',
          },
          'TA5' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'label=A;city=revenue:60,slots:2;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0',
          },
          'CO2' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'label=C;city=revenue:60,slots:2;border=edge:2,type:water;path=a:2,b:_0,track:narrow'\
                      ';path=a:0,b:_0;path=a:2,b:_0,track:thin;path=a:4,b:_0;path=a:5,b:_0',

            '611' => 3,
          },
          'OO8' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'label=OO;city=revenue:60,slots:2;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
          },
          'T7' => {
            'count' => 4,
            'color' => 'brown',
            'code' => 'label=T;city=revenue:30,slots:2;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0',
          },
          'T8' => {
            'count' => 4,
            'color' => 'brown',
            'code' => 'label=T;city=revenue:30,slots:2;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0',
          },
          'T19' => {
            'count' => 4,
            'color' => 'brown',
            'code' => 'label=T;city=revenue:30,slots:2;path=a:0,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0',
          },
          'T14' => {
            'count' => 7,
            'color' => 'brown',
            'code' => 'label=T;junction;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0',
          },
          'T15' => {
            'count' => 7,
            'color' => 'brown',
            'code' => 'label=T;junction;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0',
          },
          'T20' => {
            'count' => 7,
            'color' => 'brown',
            'code' => 'label=T;junction;path=a:0,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0',
          },
          'TA6' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'label=A;city=revenue:70,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0'\
                      ';path=a:5,b:_0',
          },
          'CO3' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'label=C;city=revenue:70,slots:3;border=edge:2,type:water;path=a:2,b:_0,track:narrow;path=a:0,b:_0'\
                      ';path=a:2,b:_0,track:thin;path=a:4,b:_0;path=a:5,b:_0',
          },
          'T13' => {
            'count' => 1,
            'color' => 'gray',
            'code' => 'label=T;city=revenue:40,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0'\
                      ';path=a:5,b:_0',
          },
          'T17' => {
            'count' => 1,
            'color' => 'gray',
            'code' => 'city=revenue:40,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
          },
          'T16' => {
            'count' => 1,
            'color' => 'gray',
            'code' => 'label=T;junction;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
          },
          'CO4' => {
            'count' => 1,
            'color' => 'gray',
            'code' => 'label=C;city=revenue:80,slots:4;border=edge:2,type:water;path=a:0,b:_0;path=a:2,b:_0;path=a:4,b:_0'\
                      ';path=a:5,b:_0',
          },
          '210' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;city=revenue:30;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_1;path=a:5,b:_1;label=OO',
          },
        }.freeze

        LOCATION_NAMES = {
          'A3' => 'Greece',
          'B2' => 'Bulgary',
          'K3' => 'Russia',
          'L8' => 'Iran',
          'K11' => 'Iraq',
          'H14' => 'Syria',

        }.freeze

        HEXES = {
          white: {
            %w[B8 C9 D6 D10 E9 F6 F10 G7 G9 G11 G13 H12] => 'label=T;town=revenue:0',
            ['A5'] => 'upgrade=cost:40,terrain:river;border=edge:5',
            ['B6'] => 'label=T;town=revenue:0;upgrade=cost:20,terrain:river;'\
                      'border=edge:2,type:water;border=edge:3,type:water;border=edge:4,type:water',

            %w[B12 E13 F12 G5 I11 K5] => 'city=revenue:0',
            ['C5'] => 'label=C;city=revenue:0;city=revenue:0;border=edge:1,type:water;border=edge:2,type:water'\
                      ';path=a:2,b:_0,track:narrow',
            ['C7'] => 'label=T;town=revenue:0;upgrade=cost:40,terrain:river;',
            %w[D8 E11] => 'town=revenue:0;town=revenue:0',
            %w[C11 E5 D12] => 'label=T;town=revenue:0;upgrade=cost:20,terrain:hill;',
            %w[C13 H6 J4 L10] => '',
            ['E7'] => 'label=A;city=revenue:0',
            ['F4'] => 'upgrade=cost:20,terrain:hill',
            %w[F8 H10] => 'upgrade=cost:20,terrain:river',
            %w[H8 I5 I7 J6 J10] => 'label=T;town=revenue:0;upgrade=cost:30,terrain:hill',
            %w[I9 K7] => 'upgrade=cost:30,terrain:hill',
            ['J8'] => 'label=T;town=revenue:0;upgrade=cost:20,terrain:river;border=edge:5,type:water',
            ['K9'] => 'label=T;town=revenue:0;upgrade=cost:30,terrain:hill;border=edge:2,type:water',
            ['B10'] => 'city=revenue:0;city=revenue:0;label=OO',
          },
          yellow: {

          },
          gray: {
            ['B4'] => 'junction;path=a:1,b:_0;path=a:3,b:_0;path=a:5,b:_0,track:narrow;border=edge:0,type:water'\
                      ';border=edge:5,type:water',
            ['J12'] => 'path=a:2,b:3',
            ['L6'] => 'path=a:1,b:2',
          },
          red: {
            ['A3'] => 'offboard=revenue:yellow_30|green_40|brown_50,groups:Bulgary;path=a:0,b:_0',
            ['B2'] => 'offboard=revenue:yellow_30|green_40|brown_50,groups:Bulgary;path=a:0,b:_0',
            ['K3'] => 'offboard=revenue:yellow_30|green_40|brown_50,groups:Russia;path=a:0,b:_0;border=edge:5',
            ['L4'] => 'offboard=revenue:yellow_30|green_40|brown_50,hide:1,groups:Russia;path=a:1,b:_0;border=edge:2',
            ['L8'] => 'offboard=revenue:yellow_20|green_40|brown_60,groups:Iran;path=a:1,b:_0;path=a:2,b:_0',
            ['K11'] => 'offboard=revenue:yellow_20|green_50|brown_70,groups:Iraq;path=a:2,b:_0;path=a:3,b:_0',
            ['H14'] => 'city=revenue:yellow_20|green_40|brown_60,groups:Syria;path=a:2,b:_0;path=a:3,b:_0',
          },
          blue: {
            ['A7'] => 'offboard=revenue:yellow_30|green_40|brown_50'\
                      ';path=a:4,b:_0',
            ['A11'] => 'offboard=revenue:yellow_20|green_30|brown_40'\
                       ';path=a:4,b:_0;path=a:5,b:_0',
            ['D4'] => 'offboard=revenue:yellow_20|green_30|brown_40'\
                      ';path=a:0,b:_0;path=a:1,b:_0;path=a:5,b:_0',
            ['F14'] => 'offboard=revenue:yellow_30|green_40|brown_50'\
                       ';path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0',
            ['H4'] => 'offboard=revenue:yellow_20|green_40|brown_60'\
                      ';path=a:0,b:_0;path=a:1,b:_0;path=a:5,b:_0',
          },
        }.freeze
      end
    end
  end
end
