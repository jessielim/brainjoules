class AnswersController < ApplicationController
    def index

    end

    def new
    	@answer = Answer.new
    	@question = Question.find(params[:question_id])
    	@quiz = Quiz.find(params[:quiz_id])
    
    end

    def create
    	@quiz = Quiz.find(params[:quiz_id])
    	@question = Question.find(params[:question_id])
    	

    	@answer1 = Answer.new(description: params[:answer1][:description], question_id: @question.id, status: (params[:answer1][:status].nil? ? false : true))
		@answer2 = Answer.new(description: params[:answer2][:description], question_id: @question.id, status: (params[:answer2][:status].nil? ? false : true))
		@answer3 = Answer.new(description: params[:answer3][:description], question_id: @question.id, status: (params[:answer3][:status].nil? ? false : true))
		@answer4 = Answer.new(description: params[:answer4][:description], question_id: @question.id, status: (params[:answer4][:status].nil? ? false : true))

		
    	respond_to do |format|
            if @answer1.save && @answer2.save && @answer3.save && @answer4.save
              
                  flash[:notice]
                format.html { redirect_to "/quizzes/#{@quiz.id}/questions/new", notice: 'Answer was successfully created.' }
                format.json 
             else
                  flash[:notice]
                format.html { redirect_to "/", notice: 'There are some errors occurred.' }
                format.json
              end
          end
    end
end


