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
 

  get "/search" => "students#search"
  get "/add_teacher" => "users#add_teacher"
  get "/teachers_index" => "teachers#index"
  post "/teachers_index" => "users#create"
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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


##student part
  get "/add_student" => "students#add_student"
  post "/students_index" => "students#student_created"
  get "/find_a_student" => "students#index"
  get "/search_student" => "students#index"
  post "/search_student" => "students#search"


##quiz part
  get "/quiz-main" => "quizzes#index"
  get "/quiz-creation" => "quizzes#new"
  post "/quiz-creation" => "quizzes#create"
  get "/quiz-creation/:quiz_id/question-creation" => "questions#new"
  post "/question-creation" => "questions#create"
  

  root to: "home#index"
end
