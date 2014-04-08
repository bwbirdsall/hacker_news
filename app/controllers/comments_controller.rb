class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to link_path(@comment.link)
    else
      flash[:alert] = "Your comment did not save. Please fill in all the fields."
      redirect_to link_path(@comment.link)
    end
  end
end
