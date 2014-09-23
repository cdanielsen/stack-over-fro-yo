class QuestionsController < ApplicationController

  before_filter :authorize, except: [:index, :show]

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    # @user = User.find(params[:id])
    @question = Question.new(question_params)
    if @question.save
      respond_to do |format|
        format.html do
          flash[:notice] = "New question created, bro!"
          redirect_to questions_path
        end
        format.js do
          flash.now[:notice] = "New question created, bro!"
          render 'create'
        end
      end
    else
      render 'errors'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Question updated, bro!"
          redirect_to question_path(@question)
        end
        format.js do
          flash.now[:notice] = "New question created, bro!"
          render 'update'
        end
      end
    else
      render 'errors'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:alert] = "You just destroyed a question!!"
    redirect_to '/questions'
  end

  private
    def question_params
      params.require(:question).permit(:headline, :content).merge(user_id: current_user.id)
    end

end
