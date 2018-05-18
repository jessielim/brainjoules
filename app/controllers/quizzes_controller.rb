class QuizzesController < ApplicationController
    def index
        @teacher = Teacher.find_by(user_id: current_user.id)
        @quiz = Quiz.where(teacher_id: @teacher.id)
        @question = Question.where(quiz_id: @quiz)
        @answer = Answer.where(question_id: @question)
    end

    def new
        @teacher = Teacher.find_by(user_id: current_user.id)
        @quiz = Quiz.new
        @questions = @quiz.questions.new
        @questions.answers.new
    end

    def create
        
        @teacher = Teacher.find_by(user_id: current_user.id)
        byebug
        @quiz =  Quiz.new(title: params[:title],code: params[:code],teacher_id: @teacher.id)

        # q =Question.new(description: params[:question][:description])
        # a =Answer.new(description: [params[:answer1][:description],params[:answer2][:description],params[:answer3][:description],params[:answer4][:description]])
        # @questions = @quiz.questions.new
        # @questions.answers.new(description: [params[:answer1][:description],params[:answer2][:description],params[:answer3][:description],params[:answer4][:description]])
        

        respond_to do |format|
            if @quiz.save
                  flash[:notice]
                format.html { redirect_to "/quiz-creation/#{@quiz.id}/question-creation", notice: 'Quiz was successfully created.' }
                format.json 
             else
                  flash[:notice]
                format.html { redirect_to "/quiz-creation", notice: 'There are some errors occurred.' }
                format.json
              end
          end
    end

    # private

    #  def quiz_params
    #     params.require(:quiz).permit(:title,:code, :teacher_id)
    #  end

    #  def question_params
    #      params.require(:question).permit(:description)
    #  end

    #  def answer_params
    #      params.require(:answer).permit(:description)
    #  end
end