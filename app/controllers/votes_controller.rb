require 'pry'

class VotesController < ApplicationController
  def create
    @vote = Vote.new(params[:vote])
    if @vote.save
      redirect_to :back
    else
      flash[:alert] = "Your vote did not save. Please try voting again. ¯\\_(ツ)_/¯"
      redirect_to link_path(@vote.link)
    end
  end

  def destroy
    @vote = Vote.find_by(:link_id => params[:vote][:link_id])
    if @vote != nil
      @vote.destroy
    end
    redirect_to :back
  end
end
