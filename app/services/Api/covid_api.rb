# frozen_string_literal: true


module Api
  # return summary of confirmed covid cases
  class CovidApi
    API_URL = 'https://api.covid19api.com/summary'

    def call
      response = HTTParty.get(API_URL)
      JSON.parse(response.body)
    end
  end
end
