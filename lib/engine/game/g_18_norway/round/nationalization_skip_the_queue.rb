# frozen_string_literal: true

require_relative '../../../round/operating'

module Engine
  module Game
    module G18Norway
      module Round
        class NationalizationSkipQueue < Engine::Round::Operating
          def name
            'Nationalization round - skip the queue '
          end

          def select_entities
            owner = @game.company_by_id('P5')&.owner
            corp = @game.operating_order.reverse.find { |entity| entity.owner == owner }
            return [] if corp.nil?

            [corp]
          end
        end
      end
    end
  end
end
