class Admin::CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to root_path, notice: "#{@company.name} was successfully added."
    else
      render :new, alert: @company.errors.full_messages.first
    end
  end

  private

  def company_params
    params.permit(:name)
  end
end
