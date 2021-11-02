# frozen_string_literal: true

# Display statistics for covid-19 cases
class HomeController < ApplicationController
  def index
    @confirmed_covid_cases = Statistics::ConfirmedCases.new.call
  end
end
