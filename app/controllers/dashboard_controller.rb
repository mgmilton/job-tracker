class DashboardController < ApplicationController
  def index
    @interest = Job.by_interest
    @top_companies = Company.top_three
    @location = Job.by_location
  end
end
