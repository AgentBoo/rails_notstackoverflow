class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = session[:user_id]
    @question.save
    redirect_to questions_path
    # redirect_to question_path(@question)
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    @question.save
    # redirect_to question_path(@question)
  end

  private
  def question_params
    params.require(:question).permit(:title, :content )
  end


end
