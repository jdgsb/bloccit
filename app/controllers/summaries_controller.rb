class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:abstract))
    if @summary.save
       redirect_to @summary, notice: "Summary was saved successfully."
    else
      flash[:error] = "Error creating summary. Please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

end
