# frozen_string_literal: true

module Engine
  module Game
    module G18Norway
      module Step
        class NationalizeCorporation < Engine::Step::Base
          def description
            'Nationalization offer'
          end

          def actions(entity)
            return [] unless nationalization_candidates.include?(entity)
            return [] if !entity.corporation? || entity != current_entity
            return [] if @game.nationalized?(entity.corporation)
            return [] if @round.nationalized

            ['choose']
          end

          def active_entities
            nationalization_candidates.take(1)
          end

          def active?
            !nationalization_candidates.empty?
          end

          def nationalization_candidates
            @game.nationalization_candidates
          end

          def choice_name
            'Nationalize Corporation'
          end

          def log_skip(entity)
            return if @game.nationalized?(entity.corporation)

            super
          end

          def choices
            choices_hash = {}
            choices_hash['0'] = 'Nationalize company by selling 0 shares to NSB' if @game.hovedbanen?(current_entity)
            choices_hash['1'] = 'Nationalize company by selling 1 share to NSB'
            choices_hash['2'] = 'Nationalize company by selling 2 shares to NSB' if @game.hovedbanen?(current_entity)
            choices_hash['decline'] = 'Decline nationalization offer'
            choices_hash
          end

          def process_choose(action)
            if action.choice == 'decline'
              @log << "#{action.entity.name} declines #{description.downcase}"
              @game.skip_nationalization(action.entity)
              pass!
              return
            end

            value = @game.convert(action.entity, action.choice.to_i)
            @log << "#{action.entity.name} nationalized and receives #{@game.format_currency(value)}"
            @game.update_cert_limit
            @round.nationalized = true
          end

          def round_state
            super.merge(
              {
                nationalized: false,
              }
            )
          end
        end
      end
    end
  end
end
