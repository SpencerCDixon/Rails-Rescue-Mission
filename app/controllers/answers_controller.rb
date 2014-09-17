class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id if current_user
    @answer.question_id = @question.id

    if @answer.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.rating.nil?
      @answer.update_attribute(:rating, 1)
    else
      num = @answer.rating + 1
      @answer.update_attribute(:rating, num)
    end

    redirect_to @question
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end

end
