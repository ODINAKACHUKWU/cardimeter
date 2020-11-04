class HomeController < ApplicationController
  def index
    @companies = @app.all_companies
  end
end
