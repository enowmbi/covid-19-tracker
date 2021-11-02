# frozen_string_literal: true


module Api
  # return summary of confirmed covid cases
  class CovidApi
    API_URL = 'https://api.covid19api.com/summary'

    def call
      response = HTTParty.get(API_URL)
      covid_cases_for_all_countries = JSON.parse(response.body)['Countries']
      entries = []
      covid_cases_for_all_countries.each do |entry|
        entries << [entry['Country'], entry['TotalConfirmed']]
      end
      entries
    end
  end
end
