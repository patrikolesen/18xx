# frozen_string_literal: true

require_relative 'meta'
require_relative '../base'
require_relative 'companies'
require_relative 'corporations'
require_relative 'map'
require_relative 'trains'
require_relative 'phases'

module Engine
  module Game
    module G18Turkey
      class Game < Game::Base
        include_meta(G18Turkey::Meta)
        include Corporations
        include Companies
        include Map
        include Trains
        include Phases

        register_colors(red: '#d1232a',
                        orange: '#f58121',
                        black: '#110a0c',
                        blue: '#025aaa',
                        lightBlue: '#8dd7f6',
                        yellow: '#ffe600',
                        green: '#32763f',
                        brightGreen: '#6ec037')

        SELL_BUY_ORDER = :sell_buy
        TILE_RESERVATION_BLOCKS_OTHERS = :always
        CURRENCY_FORMAT_STR = '$%s'

        BANK_CASH = 9_000

        CERT_LIMIT = { 3 => 18, 4 => 14, 5 => 11 }.freeze

        STARTING_CASH = { 3 => 320, 4 => 240, 5 => 192 }.freeze

        STATUS_TEXT = Base::STATUS_TEXT.merge(
          'kilometric_guarantee_active' => ['Kilometric Guarantee second tile lay is free'],
          'wwi' => ['World War I'],
          'nationalization' => ['Minors gets nationalised'],
          '' => [''],
        ).freeze

        MARKET = [
          ['', '', '', '', '111', '126', '141', '156', '177', '200', '225', '255', '285', '315', '350', '390', '440'],
          ['', '', '82', '91', '101', '110p', '125', '140', '155', '175', '197', '220', '250', '280', '310', '345'],
          ['', '72', '76', '81', '90p', '100p', '109', '124', '139', '154', '173'],
          ['', '66', '71', '75p', '80p', '89', '99', '108', '123'],
          %w[56 61 65p 70p 74 79 88],
          %w[51 55 60p 64 69 73 78],
          %w[46y 50 54 59 63],
          %w[42y 45y 49 53 58],
          %w[34o 40y 44y],
          %w[22o 30o],
          %w[10o 18o],
        ].freeze

        TILE_LAYS = [{ lay: true, upgrade: true }, { lay: true, upgrade: :not_if_upgraded }].freeze
        TRACK_RESTRICTION = :permissive

        def operating_round(round_num)
          Round::Operating.new(self, [
            Engine::Step::Bankrupt,
            Engine::Step::Exchange,
            Engine::Step::SpecialTrack,
            Engine::Step::SpecialToken,
            Engine::Step::BuyCompany,
            Engine::Step::HomeToken,
            Engine::Step::Track,
            Engine::Step::Token,
            Engine::Step::Route,
            Engine::Step::Dividend,
            Engine::Step::DiscardTrain,
            Engine::Step::BuyTrain,
            [Engine::Step::BuyCompany, { blocks: true }],
          ], round_num: round_num)
        end
      end
    end
  end
end
