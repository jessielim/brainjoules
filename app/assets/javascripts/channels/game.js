App.game = App.cable.subscriptions.create("GameChannel",{
  connected: function(){},
  disconnected: function(){},
  received: function(data){
  	let regex = new RegExp("room_id=(.*?)(?:;|$)")
  	let room_id = regex.exec(document.cookie)[1]
  	
  	if (room_id == data.room_id){
  		console.log(data.action);
  		if (data.action == "update_count"){
  			let count = document.getElementById("user_count")
  			count.innerHTML = data.userCount
  		}
  		else if(data.action == "display"){

  			$("#remove").remove()
  			let title = document.getElementById("title")
  			title.innerHTML = data.title
        $("#quiztitle").html("Quiz title:")
  			let question = document.getElementById("question")
  			question.innerHTML = data.question
        $("#questionss").html("Question: ")
  			let option1 = document.getElementById("option1")
  			option1.innerHTML = data.option1
        $("#option11").html("Answer 1: ")
  			let option2 = document.getElementById("option2")
  			option2.innerHTML = data.option2
        $("#option22").html("Answer 2: ")
  			let option3 = document.getElementById("option3")
  			option3.innerHTML = data.option3
        $("#option33").html("Answer 3: ")
  			let option4 = document.getElementById("option4")
  			option4.innerHTML = data.option4
        $("#option44").html("Answer 4: ")
  			let div = document.getElementById("btn-container")
  			if (div) {
  				div.innerHTML = '<button id="next" class="bg-dark">Next</button>'
  			}
  			let divi = document.getElementById("done")
  			if (divi) {
  				divi.innerHTML = '<button id="done-btn" class="bg-dark">Done</button>'
  			}
        $("#questionnumber").html("Question number:")
  			$("#q_number").html(data.q_number + 1)
  		}
  		else if(data.action == "next"){
  			clicked = false

  			$("#student-answered").html(0)
  			$("#student-answer-correct").html(0)
  			let question = document.getElementById("question")
  			question.innerHTML = data.question
  			let option1 = document.getElementById("option1")
  			option1.innerHTML = data.option1
  			option1.style.color = "black"
  			let option2 = document.getElementById("option2")
  			option2.innerHTML = data.option2
  			option2.style.color = "black"
  			let option3 = document.getElementById("option3")
  			option3.innerHTML = data.option3
  			option3.style.color = "black"
  			let option4 = document.getElementById("option4")
  			option4.innerHTML = data.option4
  			option4.style.color = "black"
  			$("#q_number").html(data.q_number)
  			 

  		}
  		else if (data.action == "student_answered"){
  			// console.log("inside of if block");
  			let count = document.getElementById("student-answered")
  			if (count) {
  				count.innerHTML = parseInt(count.innerHTML) + 1
  			}
  			if (data.correct){
	  			let studentcount = document.getElementById("student-answer-correct")
	  			if (studentcount) {
	  				studentcount.innerHTML = parseInt(studentcount.innerHTML) + 1
	  			}

  			}
  		}
  		else if (data.action == "done_page"){
  			$.ajax({
  				url: "/role",
  				method: "GET",
  				dataType: "JSON",
  				success: function(data) {
  			if (data.role == "student") {
	  			$("#whole-pg").remove()
          $("#studentcorrectanswers").html("Correct: ")
	  			$("#correct").html(answered_question)
          $("#studenttotalanswers").html("Total questions: ")
	  			$("#answered").html(correct_answer) 
  			}
  				}
  			})
  		}
  	}
  }
});
    