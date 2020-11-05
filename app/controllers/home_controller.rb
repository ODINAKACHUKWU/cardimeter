class HomeController < ApplicationController
  def index
    if current_user.is_admin?
      @companies = @app.all_companies
    else
      @companies = current_user.companies.order(created_at: :desc)
    end
  end
end
