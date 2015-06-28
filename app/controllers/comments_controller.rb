class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])

    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @comments = @post.comments
    @new_comment = Comment.new
    authorize @comment 

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.find(params[:id])
    authorize @comment
    
    if @comment.destroy
      flash[:notice] = "Comment was successfully deleted"
      
    else
      flash[:error] = "There was an error deleting the comment. Please try agian"
      
    end

    respond_to do |format|
       format.html
       format.js
    end

  end


  private 
  def comment_params
    params.require(:comment).permit(:body)
  end

end
