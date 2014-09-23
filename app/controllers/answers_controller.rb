class AnswersController < ApplicationController

  before_filter :authorize, except: [:show]

  def new
    @answer = Answer.new
  end



end
