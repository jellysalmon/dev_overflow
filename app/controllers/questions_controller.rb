class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.create(title: "new answer", content: "place content here")
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    redirect_to questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])

  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end



  private
    def question_params
      params.require(:question).permit(:title, :content)
    end

end
