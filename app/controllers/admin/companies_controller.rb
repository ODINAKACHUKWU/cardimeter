class Admin::CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to root_path, notice: "#{@company.name} was successfully added."
    else
      redirect_to new_admin_company_path, alert: @company.errors.full_messages.first
    end
  end

  def show
    @company = Company.find(params[:id])
    @shareholders = @company.users
  end

  private

  def company_params
    params.permit(:name)
  end
end
