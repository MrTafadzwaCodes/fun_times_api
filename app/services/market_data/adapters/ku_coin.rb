# typed: false
# frozen_string_literal: true

require 'faraday'
require 'json'
module MarketData
  module Adapters
    class KuCoin
      API_URL = 'https://api.kucoin.com/api/v1'

      def initialize(symbol)
        @symbol = symbol.upcase
      end

      def fetch_market_data
        response = request_market_data

        raise Errors::KuCoinError, "API Error: #{response.status}" unless response.success?

        parse_response(response.body)
      rescue Faraday::ConnectionFailed
        raise Errors::KuCoinError, 'API connection failed'
      rescue JSON::ParserError
        raise Errors::KuCoinError, 'Invalid response format'
      rescue StandardError => e
        raise Errors::KuCoinError, e.message
      end

      private

      def request_market_data
        Faraday.get("#{API_URL}/market/stats", { symbol: @symbol })
      end

      def parse_response(body)
        data = JSON.parse(body)['data']
        raise Errors::KuCoinError, 'Market data missing' unless data

        {
          source: 'KuCoin',
          symbol: @symbol,
          price: data['last'].to_f,
          volume: data['vol'].to_f,
          high_24h: data['high'].to_f,
          low_24h: data['low'].to_f
        }
      end
    end
  end
end
