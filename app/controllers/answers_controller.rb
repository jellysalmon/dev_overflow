class AnswersController < ApplicationController
  

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    
    respond_to do |format|
      format.html {redirect_to @answer}
      format.js
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.upvote

    respond_to do |format|
      format.html
      format.js
    end

  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.downvote

    respond_to do |format|
      format.html
      format.js
    end

  end



  private
    def answer_params
      params.require(:answer).permit(:title, :content)
    end

end
