# frozen_string_literal: true


module Api
  # return summary of confirmed covid cases
  class CovidApi
    def call
      cached_value = Rails.cache.read(cache_key)
      return cached_value if cached_value.present?

      response = HTTParty.get(API_URL)
      confirmed_cases = JSON.parse(response.body)['Countries']
      entries = []
      confirmed_cases.each do |entry|
        entries << [entry['Country'], entry['TotalConfirmed']]
      end

      Rails.cache.write(cache_key, entries, expires_in: expiry_time_in_seconds)

      entries
    end

    private

    def cache_key
      "confirmed_cases_#{Date.current.strftime('%Y_%m_%d')}"
    end

    def expiry_time_in_seconds
      (86_400 - Time.now.seconds_since_midnight).seconds
    end
  end
end
