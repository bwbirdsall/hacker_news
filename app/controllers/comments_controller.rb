class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      parent = @comment.commentable
      if (parent.class.name == "Link")
        redirect_to :back
      else
        until parent.class.name == "Link"
          parent = parent.commentable
        end
        redirect_to link_path(parent.id)
      end
    else
      flash[:alert] = "Your comment did not save. Please fill in all the fields."
      redirect_to :back
    end
  end

  def new
    @parent = Comment.find(params[:parent_id])
  end
end
