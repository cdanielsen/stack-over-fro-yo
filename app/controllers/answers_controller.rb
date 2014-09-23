class AnswersController < ApplicationController

  before_filter :authorize, except: [:show]

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @question.answers << @answer
    if @answer.save
      flash[:notice] = "Your answer was posted!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Answer must have content, bitch!"
      redirect_to question_path(@question)
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end


private
  def answer_params
    params.require(:answer).permit(:content).merge(user_id: current_user.id)
  end

end
