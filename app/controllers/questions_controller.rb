class QuestionsController < ApplicationController
    def index
    
    end

    def new
        @question = Question.new
        @question.answers.new
    end

    def create
        @quiz = Quiz.find(params[:id])
        @questions = @quiz.questions.new
        @questions.answers.new(description: [params[:answer1][:description],params[:answer2][:description],params[:answer3][:description],params[:answer4][:description]])
        respond_to do |format|
            if @question.save
                  flash[:notice]
                format.html { redirect_to "/", notice: 'Quiz was successfully created.' }
                format.json 
             else
                  flash[:notice]
                format.html { redirect_to "/quiz-creation", notice: 'There are some errors occurred.' }
                format.json
              end
          end
    end
end