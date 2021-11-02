class HomeController < ApplicationController
  def index
    @summary_of_covid_cases = Api::CovidApi.new.call()
  end
end
