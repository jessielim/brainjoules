class QuizzesController < ApplicationController
    def index
        @teacher = Teacher.find_by(user_id: current_user.id)
        @quiz = Quiz.where(teacher_id: @teacher.id)
        # @question = Question.where(quiz_id: @quiz)
        # @answer = Answer.where(question_id: @question)
    end

    def new
        @teacher = Teacher.find_by(user_id: current_user.id)
        @quiz = Quiz.new
    end

    def create
        @teacher = Teacher.find_by(user_id: current_user.id)
        @quiz =  Quiz.new(title: params[:title],code: params[:code],teacher_id: @teacher.id)

        respond_to do |format|
            if @quiz.save
                  flash[:notice]
                format.html { redirect_to "/quizzes/#{@quiz.id}/questions/new" , notice: 'Quiz was successfully created.' }
                format.json 
             else
                  flash[:notice]
                format.html { redirect_to "/", notice: 'There are some errors occurred.' }
                format.json
              end
          end
    end


    def show
        @teacher = Teacher.find_by(user_id: current_user.id)
        @quiz = Quiz.where(teacher_id: @teacher.id)
        @question = Question.where(quiz_id: @quiz)
        @answer = Answer.where(question_id: @question)
        
        @editquiz = Quiz.find(params[:id])
        @editquestion = Question.find_by(quiz_id: @editquiz.id)
    end

    def search
    if params[:query].present?
       
       @quiz = Quiz.search_quiz(params[:query])
       @quizzes = Quiz.search_by_title(params[:query])
       respond_to do |format|
          format.html
          format.json {render json: @quiz}
          format.js
         end
     end

 end


    def edit
        @teacher = Teacher.find_by(user_id: current_user.id)
        # @quiz = Quiz.where(teacher_id: @teacher.id)
        @quiz = Quiz.find(params[:id])
    end

    def update
        byebug
        @quiz = Quiz.find(params[:id])
        respond_to do |format|
      if @quiz.update(title: params[:quiz][:title])
        format.html { redirect_to "/quizzes", notice: 'Quiz was successfully updated.' }
        format.json 
      else
        format.html { redirect_to "/quizzes/#{@quiz.id}", notice: 'Error.' }
        format.json 
      end
    end
    end

end