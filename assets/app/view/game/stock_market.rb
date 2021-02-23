# frozen_string_literal: true

require 'lib/settings'
require 'view/game/token'

module View
  module Game
    class StockMarket < Snabberb::Component
      include Lib::Settings

      needs :game
      needs :user, default: nil, store: true
      needs :show_bank, default: false
      needs :explain_colors, default: false

      COLOR_MAP = {
        red: '#ffaaaa',
        blue: '#35a7ff',
        brown: '#8b4513',
        orange: '#ffbb55',
        yellow: '#ffff99',
        black: '#000000',
        gray: '#888888',
        green: '#aaffaa',
        white: '#ffffff',
        olive: '#d1e189',
        purple: '#9a4eae',
      }.freeze

      # All markets
      PAD = 5                                     # between box contents and border
      BORDER = 1
      WIDTH_TOTAL = 50                            # of entire box, including border
      TOKEN_SIZE = 25
      TOKEN_SIZES = { small: 25, medium: 32, large: 40 }.freeze

      # 1D markets
      VERTICAL_TOKEN_PAD = 4                      # vertical space between tokens
      MIN_NUM_TOKENS = 4                          # guarantee space for this many tokens
      PRICE_HEIGHT = 20                           # depends on font and size!

      # 2D markets
      HEIGHT_TOTAL = 50
      TOKEN_PAD = 3                               # left/right padding of tokens within box
      BOX_WIDTH = WIDTH_TOTAL - 2 * BORDER
      LEFT_MARGIN = TOKEN_PAD                     # left edge of leftmost token
      RIGHT_MARGIN = BOX_WIDTH - TOKEN_PAD        # right edge of rightmost token
      LEFT_TOKEN_POS = LEFT_MARGIN
      RIGHT_TOKEN_POS = RIGHT_MARGIN - TOKEN_SIZE # left edge of rightmost token
      MID_TOKEN_POS = (LEFT_TOKEN_POS + RIGHT_TOKEN_POS) / 2

      TOKEN_STYLE_1D = {
        textAlign: 'center',
        lineHeight: '0',
      }.freeze

      PRICE_STYLE_1D = {
        fontSize: '100%',
        textAlign: 'center',
      }.freeze

      def box_style_1d
        {
          position: 'relative',
          display: 'inline-block',
          padding: "#{PAD}px",
          margin: '0',
          verticalAlign: 'top',
          width: "#{WIDTH_TOTAL - 2 * PAD - 2 * BORDER}px",
          border: "solid #{BORDER}px rgba(0,0,0,0.2)",
          color: color_for(:font2),
        }
      end

      CROSSHATCH_TYPES = %i[par_overlap convert_range].freeze
      BORDER_TYPES = %i[max_price].freeze

      def cell_style(box_style, types)
        normal_types = types.reject { |t| BORDER_TYPES.include?(t) }
        color = @game.class::STOCKMARKET_COLORS[normal_types&.first]
        color_to_use = color ? COLOR_MAP[color] : color_for(:bg2)

        style = if !(normal_types & CROSSHATCH_TYPES).empty? && normal_types.size > 1
                  secondary = @game.class::STOCKMARKET_COLORS[(normal_types & CROSSHATCH_TYPES).first]
                  secondary_color = secondary ? COLOR_MAP[secondary] : color_for(:bg2)
                  box_style.merge(background: "repeating-linear-gradient(45deg, #{color_to_use}, #{color_to_use} 10px,
                    #{secondary_color} 10px, #{secondary_color} 20px)")
                else
                  box_style.merge(backgroundColor: color_to_use)
                end

        unless (types & BORDER_TYPES).empty?
          style[:borderRightWidth] = "#{BORDER * 4}px"
          style[:borderRightColor] = COLOR_MAP[:purple]
        end
        if color == :black
          style[:color] = 'gainsboro'
          style[:borderColor] = color_for(:font)
        end

        style
      end

      def grid_1d_price(price)
        if price.acquisition?
          h(:div, { style: PRICE_STYLE_1D }, 'Acq.')
        elsif price.type == :safe_par
          h(:div, { style: PRICE_STYLE_1D.merge(textDecoration: 'underline') }, price.price)
        else
          h(:div, { style: PRICE_STYLE_1D }, price.price)
        end
      end

      def operated?(corporation)
        return unless @game.round.operating?

        order = @game.round.entities.index(corporation)
        idx = @game.round.entities.index(@game.round.current_entity)
        order < idx if order && idx
      end

      def token_props(corporation, index = nil, num = nil, spacing = nil)
        props = {
          attrs: {
            src: logo_for_user(corporation),
            title: corporation.name,
            width: "#{TOKEN_SIZES[@game.corporation_size(corporation)]}px",
          },
          style: { marginTop: "#{VERTICAL_TOKEN_PAD}px" },
        }
        if index
          props[:attrs][:width] = "#{TOKEN_SIZE}px"
          props[:style] = {
            position: 'absolute',
            left: num > 1 ? "#{LEFT_TOKEN_POS + ((num - index - 1) * spacing)}px" : "#{MID_TOKEN_POS}px",
            zIndex: num - index,
          }
        end
        if operated?(corporation)
          props[:attrs][:title] = "#{corporation.name} has operated"
          props[:style][:opacity] = '0.6'
          props[:style][:clipPath] = 'polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%)'
        end

        props
      end

      def grid_1d
        token_height = @game.stock_market.market.first.map do |p|
          p.corporations.sum { |c| TOKEN_SIZES[@game.corporation_size(c)] + VERTICAL_TOKEN_PAD }
        end.push(MIN_NUM_TOKENS * (TOKEN_SIZE + VERTICAL_TOKEN_PAD)).max
        box_height = token_height + VERTICAL_TOKEN_PAD + PRICE_HEIGHT + 2 * PAD
        height = "#{box_height - 2 * PAD - 2 * BORDER}px"

        row = @game.stock_market.market.first.map do |price|
          tokens = price.corporations.map { |corporation| h(:img, token_props(corporation)) }

          box_style = box_style_1d
          box_style[:height] = height
          box_style = box_style.merge('margin-right': '10px') unless price.normal_movement?

          h(:div, { style: cell_style(box_style, price.types) }, [
            grid_1d_price(price),
            h(:div, { style: TOKEN_STYLE_1D }, tokens),
          ])
        end

        [h(:div, { style: { width: 'max-content' } }, row)]
      end

      def grid_zigzag
        box_style = box_style_1d

        half_box_style = box_style_1d
        half_box_style[:width] = "#{WIDTH_TOTAL / 2 - 2 * PAD - 2 * BORDER}px"

        max_num_corps = @game.stock_market.market.first.map { |p| p.corporations.size }.push(MIN_NUM_TOKENS).max
        box_height = max_num_corps * (TOKEN_SIZE + VERTICAL_TOKEN_PAD) + VERTICAL_TOKEN_PAD + PRICE_HEIGHT + 2 * PAD
        box_style[:height] = "#{box_height - 2 * PAD - 2 * BORDER}px"
        half_box_style[:height] = "#{box_height - 2 * PAD - 2 * BORDER}px"

        row0 = []
        row1 = [h(:div, style: cell_style(half_box_style, @game.stock_market.market.first.first.types))]

        @game.stock_market.market.first.each_with_index do |price, idx|
          tokens = price.corporations.map { |corporation| h(:img, token_props(corporation)) }

          element = h(:div, { style: cell_style(box_style, price.types) }, [
                      h(:div, { style: PRICE_STYLE_1D }, price.price),
                      h(:div, { style: TOKEN_STYLE_1D }, tokens),
                    ])
          if idx.even?
            row0 << element
          else
            row1 << element
          end
        end

        row1 << h(:div, style: cell_style(half_box_style, @game.stock_market.market.first.last.types))

        [h(:div, { style: { width: 'max-content' } }, row0),
         h(:div, { style: { width: 'max-content' } }, row1)]
      end

      def grid_2d
        @game.stock_market.market.flat_map do |row_prices|
          row = row_prices.map do |price|
            if price
              corporations = price.corporations
              num = corporations.size
              spacing = num > 1 ? (RIGHT_TOKEN_POS - LEFT_TOKEN_POS) / (num - 1) : 0
              tokens = corporations.map.with_index { |corp, index| h(:img, token_props(corp, index, num, spacing)) }

              h(:div, { style: cell_style(@box_style_2d, price.types) }, [
                h(:div, { style: { fontSize: '80%' } }, price.price),
                h(:div, tokens),
              ])
            else
              h(:div, { style: @space_style_2d }, '')
            end
          end

          h(:div, { style: { width: 'max-content' } }, row)
        end
      end

      def logo_for_user(entity)
        @user&.dig('settings', 'simple_logos') ? entity.simple_logo : entity.logo
      end

      def render
        # For locations in the grid with no cells
        @space_style_2d = {
          position: 'relative',
          display: 'inline-block',
          padding: "#{PAD}px",
          width: "#{WIDTH_TOTAL - 2 * PAD - 2 * BORDER}px",
          height: "#{HEIGHT_TOTAL - 2 * PAD - 2 * BORDER}px",
          border: "solid #{BORDER}px rgba(0,0,0,0)",
          margin: '0',
          verticalAlign: 'top',
        }

        # For cells with prices
        @box_style_2d = @space_style_2d.merge(
          border: "solid #{BORDER}px rgba(0,0,0,0.2)",
          color: color_for(:font2),
        )

        grid = if @game.stock_market.one_d?
                 if @game.stock_market.zigzag?
                   grid_zigzag
                 else
                   grid_1d
                 end
               else
                 grid_2d
               end

        children = []

        props = {
          style: {
            marginBottom: '1rem',
          },
        }

        children << h(:div, props, [h(Bank, game: @game)].compact)
        grid_props = {
          style: {
            width: '100%',
            overflow: 'auto',
          },
        }
        children << h(:div, grid_props, grid)

        if @explain_colors
          type_text = @game.class::MARKET_TEXT
          colors = @game.class::STOCKMARKET_COLORS

          types_in_market = @game.stock_market.market.flatten.compact.flat_map(&:types)
          .uniq.map { |p| [p, colors[p]] }.to_h

          type_text.each do |type, text|
            next unless types_in_market.include?(type)

            color = types_in_market[type]

            style = @box_style_2d.merge(backgroundColor: COLOR_MAP[color])
            style[:borderColor] = color_for(:font) if color == :black

            line_props = {
              style: {
                display: 'grid',
                grid: '1fr / auto 1fr',
                gap: '0.5rem',
                alignItems: 'center',
                marginTop: '1rem',
              },
            }

            children << h(:div, line_props, [
              h(:div, { style: cell_style(@box_style_2d, [type]) }, []),
              h(:div, text),
            ])
          end
        end

        if @game.respond_to?(:price_movement_chart)
          header, *chart = @game.price_movement_chart

          props = {
            style: {
              border: '1px solid',
            },
          }

          rows = chart.map do |r|
            h(:tr, props, [
              h('td.right', props, r[0]),
              h(:td, props, r[1]),
            ])
          end

          table_props = {
            style: {
              margin: '0.5rem 0 0.5rem 0',
              textAlign: 'left',
              border: '1px solid',
              borderColor: color_for(:font),
              borderCollapse: 'collapse',
            },
          }

          header_props = {
            style: {
              backgroundColor: color_for(:bg2),
              border: '1px solid',
            },
          }

          children << h(:table, table_props, [
            h(:thead, [
              h(:tr, props, [
                h('th.no_padding', header_props, header[0]),
                h(:th, header_props, header[1]),
              ]),
            ]),
            h(:tbody, rows),
          ])
        end

        h(:div, children)
      end
    end
  end
end
