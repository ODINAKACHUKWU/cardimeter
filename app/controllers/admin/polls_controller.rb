class Admin::PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update]

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      redirect_to admin_poll_path(@poll), notice: "Poll created successfully. Add items to the poll"
    else
      render :new, alert: @poll.errors.full_messages.first
    end
  end

  def show
    @items = @poll.items.order(created_at: :desc)
  end

  def update
    @poll.status = false
    if @poll.save
      redirect_to admin_poll_path(@poll), notice: "Poll was closed successfully."
    else
      redirect_to admin_poll_path(@poll), alert: @poll.errors.full_messages.first
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:company_id).merge(title: params[:title])
  end

  def set_poll
    @poll = Poll.find(params[:id])
  end
end
