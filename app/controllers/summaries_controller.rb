class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts
    @summary = Summary.new(params.require(:summary).permit(:abstract))
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

end
