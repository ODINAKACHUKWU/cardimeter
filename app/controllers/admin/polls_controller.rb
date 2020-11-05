class Admin::PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update, :destroy, :publish, :share]

  def index
    @polls = @app.all_polls
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      redirect_to admin_poll_path(@poll), notice: "Poll created successfully. Add items to the poll"
    else
      render :new, alert: @poll.errors
    end
  end

  def publish
    @poll.publish = true
    @poll.published_at = Time.now
    if @poll.save
      redirect_to admin_poll_path(@poll), notice: "Poll published successfully."
    else
      redirect_to admin_poll_path(@poll), alert: @poll.errors
    end
  end

  def share
    @poll.share = true
    @poll.shared_at = Time.now
    if @poll.save
      redirect_to admin_poll_path(@poll), notice: "Poll's result shared successfully."
    else
      redirect_to admin_poll_path(@poll), alert: @poll.errors
    end
  end

  def show
    @items = @poll.items.order(created_at: :desc)
  end

  def destroy
    unless @poll.open?
      @poll.destroy
      redirect_to admin_polls_path, notice: "Poll deleted successfully."
    end
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
