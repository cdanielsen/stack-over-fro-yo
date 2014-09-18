class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "New question created, bro!"
      redirect_to "/questions"
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

end
