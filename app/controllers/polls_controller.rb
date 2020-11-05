class PollsController < ApplicationController
  def show
    @poll = Poll.find(params[:id])
    @items = @poll.items
  end
end
