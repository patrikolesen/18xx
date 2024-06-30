# frozen_string_literal: true

module Engine
  module Game
    module G18Norway
      module Step
        class NationalizeSkipQueue < Engine::Step::Base
          def description
            'Nationalization offer - Skip Queue'
          end

          def actions(entity)
            return [] unless entity.corporation?
            return [] unless @game.company_by_id('P5').owner == entity.owner

            %w[choose pass]
          end

          def choice_name
            'Use P5 ability and bypass the nationalization queue'
          end

          def log_skip(entity); end

          def choices
            corps = @game.corporations.select { |corp| corp.owner == current_entity.owner }
            choices_hash = {}
            corps.each do |corp|
              choices_hash[corp.name + '_0'] = "Nationalize #{corp.name} by selling 0 share to NSB" if @game.hovedbanen?(corp)
              choices_hash[corp.name + '_1'] = "Nationalize #{corp.name} by selling 1 share to NSB"
              choices_hash[corp.name + '_2'] = "Nationalize #{corp.name} by selling 2 share to NSB" if @game.hovedbanen?(corp)
            end
            choices_hash
          end

          def process_choose(action)
            m = action.choice.match(/(?<id>\w)_(?<count>\d)/)
            corp = @game.corporation_by_id(m[:id])
            value = @game.convert(corp, m[:count].to_i)
            @log << "#{corp.name} nationalized and receives #{@game.format_currency(value)}"
            @game.company_by_id('P5').close!
            @game.skip_next_nationalization!
            @game.update_cert_limit
          end
        end
      end
    end
  end
end
