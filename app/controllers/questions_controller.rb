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
   byebug
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

  


    
end