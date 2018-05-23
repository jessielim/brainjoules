class RoomsController < ApplicationController
	require 'securerandom'

	def create
		
		@room = Room.create(room_id: SecureRandom.hex(2))
		@room.users << current_user
		cookies[:room_id] = @room.room_id
		redirect_to rooms_path

	end


	 def join
	  	if current_user
	  		room = Room.find_by(room_id: params[:q])
	  		if room
	  			room.users << current_user
	  			cookies[:room_id] = room.room_id
	  			ActionCable.server.broadcast'game_channel',{
	  				room_id: room.room_id,
	  				action: "update_count", 
	  				userCount: room.users.count

	  			}
  			end
  		end
	 	@room = current_user.room
		@users_in_room = @room.users
		@user_student = @users_in_room.where(role: "student")
  		render "new"
  	
  	end

  	def select_quiz
  		
  		q1 = Quiz.find_by(title: params[:title])
  		@room = current_user.room
  		current_user.room.quiz_id = q1.id
  		current_user.room.save
  		@users_in_room = @room.users
		@user_student = @users_in_room.where(role: "student")
  		
  		
  		if q1
  			ActionCable.server.broadcast'game_channel',{
  				action: "display",
  				q_number: 0,
  				room_id: current_user.room.room_id,
  				title: q1.title,
  				question: q1.questions[0].description,
  				option1: q1.questions[0].answers[0].description,
  				option2: q1.questions[0].answers[1].description,
  				option3: q1.questions[0].answers[2].description,
  				option4: q1.questions[0].answers[3].description
  			}
  		end

  	end


  	def next_question
  		q1 = Quiz.find_by(title: params[:title])
  		 next_question = q1.questions[params["q_number"].to_i]
  		
  		@room = current_user.room

  		current_user.room.quiz_id = q1.id
		
  		if q1
  		
  			ActionCable.server.broadcast'game_channel',{
				action: "next",
				q_number: params["q_number"].to_i + 1,
  				room_id: current_user.room.room_id,
  				question: next_question.description,
  				option1: next_question.answers[0].description,
  				option2: next_question.answers[1].description,
  				option3: next_question.answers[2].description,
  				option4: next_question.answers[3].description
 
  			}
  		end
  	end

	def index
		@room = current_user.room
		@users_in_room = @room.users
		@user_student = @users_in_room.where(role: "student")
		@quiz = Quiz.all

		render "new"

	end

	def check_correct
		@room = current_user.room
		@quiz = Quiz.find_by_id(@room.quiz_id)
		@question = @quiz.questions[params["q_number"].to_i - 1]
		@answer = @question.answers[params["answer_number"].to_i - 1]
		student = Student.find_by_user_id(current_user.id)
		 
		if @answer.status
			student.update(score: student.score + 1)
		end

		ActionCable.server.broadcast'game_channel',{
				action: "student_answered",
				correct: @answer.status,
				room_id: current_user.room.room_id,
  			}

		render json: {"result": @answer.status}


	end

	def done
		@room = current_user.room
		
		ActionCable.server.broadcast'game_channel',{
				action: "done_page",
				room_id: current_user.room.room_id
  			}
	end

	def role
		@role = current_user.role
		render json: {role: @role}
	end

end