# frozen_string_literal: true

class PursesController < ApplicationController

  def show
    @purse = Purse.find(params[:id])
  end

  def create
    @purse = current_user.purses.create(purse_params)
  end

  def edit
    @purse = Purse.find(params[:id])
  end

  def update
    @purse = Purse.find(params[:id])
    if @purse.update(purse_params)
      redirect_to @purse
    else
      render 'edit'
    end
  end

  private

  def purse_params
    params.require(:purse).permit(:balance, :user_id)
  end
end
