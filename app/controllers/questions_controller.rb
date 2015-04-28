class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
     if @question.save
       flash[:notice] = "Question was saved."
       redirect_to @question
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :new
     end
  end

  def update
    @question = Question.find(params[:id])
     if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
       flash[:notice] = "Question was updated."
       redirect_to @question
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :edit
     end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
    flash[:alert] = "Question deleted"
  end

  def resolved
    @question = Question.find(params[:id])
    @question.resolved
    redirect_to root_path
    flash[:alert] = "Question resolved"
    
  end
 

end
