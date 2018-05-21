App.game = App.cable.subscriptions.create("GameChannel",{
  connected: function(){},
  disconnected: function(){},
  received: function(data){
  	let regex = new RegExp("room_id=(.*?)(?:;|$)")
  	let room_id = regex.exec(document.cookie)[1]
  	if (room_id == data.room_id){
  		if (data.action == "update_count"){
  			let count = document.getElementById("user_count")
  			count.innerHTML = data.userCount
  		}
  		else if(data.action == "display"){

  			$("#form").remove()
  			let title = document.getElementById("title")
  			title.innerHTML = data.title
  			let question = document.getElementById("question")
  			question.innerHTML = data.question
  			let option1 = document.getElementById("option1")
  			option1.innerHTML = data.option1
  			let option2 = document.getElementById("option2")
  			option2.innerHTML = data.option2
  			let option3 = document.getElementById("option3")
  			option3.innerHTML = data.option4
  			let option4 = document.getElementById("option4")
  			option4.innerHTML = data.option4
  			let div = document.getElementById("btn-container")
  			div.innerHTML = '<button id="next">Next</button>'
  		}
  		else if(data.action == "next"){
  			
  			let question = document.getElementById("question")
  			question.innerHTML = data.question
  			let option1 = document.getElementById("option1")
  			option1.innerHTML = data.option1
  			let option2 = document.getElementById("option2")
  			option2.innerHTML = data.option2
  			let option3 = document.getElementById("option3")
  			option3.innerHTML = data.option4
  			let option4 = document.getElementById("option4")
  			option4.innerHTML = data.option4
  		}
  	}
  }
});
    