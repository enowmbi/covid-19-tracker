# frozen_string_literal: true

# Display statistics for covid-19 cases
class HomeController < ApplicationController
  def index
    @total_confirmed_cases = Statistics::TotalConfirmedCases.new.call
  end
end
