class QuestionsController < ApplicationController
    def index
      
    end

    def new
        @question = Question.new
        @quiz = Quiz.find(params[:quiz_id])
        # @quizfinder = Quiz.where(teacher_id: current_user.id)
        # @questionfinder = Question.where(quiz_id: @quizfinder)

    end

    def create
      @quiz = Quiz.find(params[:quiz_id])
      @question = Question.new(description: params[:description], quiz_id: @quiz.id)

        respond_to do |format|
            if @question.save
                flash[:notice]
                format.html { redirect_to "/quizzes/#{@quiz.id}/questions/#{@question.id}/answers/new", notice: 'Question was successfully created.' }
                format.json 
             else
                  flash[:notice]
                format.html { redirect_to "/", notice: 'There are some errors occurred.' }
                format.json
              end
          end
    end

    def edit
      @editquiz = Quiz.find(params[:quiz_id])
      @editquestion = Question.find(params[:id])
      @teacher = Teacher.find_by(user_id: current_user.id)
        @quiz = Quiz.where(teacher_id: @teacher.id)
        @question = Question.where(quiz_id: @quiz)
        # @answer = Answer.where(question_id: @question)

    end
    
    def update

    end
    
end