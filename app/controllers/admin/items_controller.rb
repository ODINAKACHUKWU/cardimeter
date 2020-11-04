class Admin::ItemsController < ApplicationController
  def create
    @item = Item.new(title: params[:title], poll_id: params[:poll_id])

    if @item.save
      redirect_to admin_poll_path(params[:poll_id]), notice: "Item added successfully."
    else
      redirect_to admin_poll_path(params[:poll_id]), alert: @item.errors.full_messages.first
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to admin_poll_path(@item.poll_id), notice: "Item deleted successfully."
    else
      redirect_to admin_poll_path(@item.poll_id), alert: @item.errors.full_messages.first
    end
  end
end
