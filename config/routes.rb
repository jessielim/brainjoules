Rails.application.routes.draw do
 

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
 

 ##teacher part
  get "/add_teacher" => "teachers#add_teacher"
  post "/teachers_index" => "teachers#teacher_created"
  get "/find_a_teacher" => "teachers#index"
  get "/search_teacher" => "teachers#index"
  post "/search_teacher" => "teachers#search"
  delete "/teacher/:id" => "teachers#destroy"
  get "/teacher/:id/edit" => "teachers#edit"
  post "/teacher/:id/edit" => "teachers#update"

##student part
  get "/add_student" => "students#add_student"
  post "/students_index" => "students#student_created"
  get "/find_a_student" => "students#index"
  get "/search_student" => "students#index"
  post "/search_student" => "students#search"
  delete "/student/:id" => "students#destroy"
  get "/student/:id/edit" => "students#edit"
  post "/student/:id/edit" => "students#update"


##quiz part
  get "/quiz-main" => "quizzes#index"
  get "/quiz-creation" => "quizzes#new"
  post "/quiz-creation" => "quizzes#create"
  get "/quiz-creation/:quiz_id/question-creation" => "questions#new"
  post "/question-creation" => "questions#create"
  

  root to: "home#index"
end


         
