class VotesController < ApplicationController
  def create
    return redirect_to poll_path(params[:poll_id]), alert: "Please select an item before submitting." if params[:item_id].nil?

    return redirect_to poll_path(params[:poll_id]), alert: "Sorry, you can't vote on this poll. It is closed." unless poll_open?

    return redirect_to poll_path(params[:poll_id]), alert: "You have already voted." if user_voted?

    @vote = Vote.new(item_id: params[:item_id], poll_id: params[:poll_id], user_id: current_user.id)
    if @vote.save
      redirect_to company_path(params[:company_id]), notice: "Your vote has been recorded successfully."
    else
      redirect_to company_path(params[:company_id]), alert: @vote.errors.full_messages.first
    end
  end

  private

  def user_voted?
    Vote.where(user_id: current_user.id, poll_id: params[:poll_id]).present?
  end

  def poll_open?
    Poll.find(params[:poll_id]).open?
  end
end
