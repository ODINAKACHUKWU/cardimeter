class CompaniesController < ApplicationController
  before_action :set_company, only: [:show]

  def show
    @polls = @company.polls.where(company_id: @company.id, publish: true)
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end
end
