class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = session[:user_id]
    @answer.save
    redirect_to question_path(@question)
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.update(:correct => params[:correct])
    @answer.save
    redirect_to question_path(@question)
  end

  def destroy
    @question. Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:content, :correct)
  end
end
