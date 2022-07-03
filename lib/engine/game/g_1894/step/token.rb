# frozen_string_literal: true

require_relative '../../../step/token'

module Engine
  module Game
    module G1894
      module Step
        class Token < Engine::Step::Token
          def actions(entity)
            puts @game.skip_track_and_token.inspect
            return [] if @game.skip_track_and_token

            super
          end

          def place_token(entity, city, token, connected: true, extra_action: false, special_ability: nil)
            raise GameError, "#{city.hex.location_name} may not be tokened" if city.hex.name == Engine::Game::G1894::Game::LONDON_HEX

            raise GameError, "#{city.hex.location_name} may not be tokened until removed tokens are placed again" if @game.saved_tokens_hex && city.hex.name == @game.saved_tokens_hex.name && @game.saved_tokens && @game.saved_tokens.size > 1

            super
          end
        end
      end
    end
  end
end
