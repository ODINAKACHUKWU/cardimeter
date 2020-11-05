class Admin::SharesController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_share, only: [:edit, :update]

  def create
    return redirect_to admin_company_path(params[:company_id]), notice: "Please provide the required email and shares units." unless @user.present?

    share = get_user_share
    return redirect_to admin_company_path(params[:company_id]), notice: "#{@user.full_name} has already been assigned shares." if share.present?

    @share = Share.new(units: params[:units], company_id: params[:company_id], user_id: @user.id)
    if @share.save
      redirect_to admin_company_path(params[:company_id]), notice: "#{@user.full_name} has been assigned shares."
    else
      redirect_to admin_company_path(params[:company_id]), alert: @share.errors.full_messages.first  
    end
  end

  def edit
    @user = User.find(@share.user_id)
  end

  def update
    @share.units = params[:units]
    if @share.save
      redirect_to admin_company_path(@share.company_id), notice: "#{@share.user.full_name}'s shares has been updated."
    else
      redirect_to admin_company_path(@share.company_id), alert: @share.errors.full_messages.first  
    end
  end

  private

  def get_user_share
    return nil unless @user.present?

    share = Share.where(user_id: @user.id, company_id: params[:company_id])
    return nil if share.empty?

    share
  end

  def set_share
    @share = Share.find(params[:id])
  end

  def set_user
    @user = User.find_by_email(params[:email])
  end
end
