Rails.application.routes.draw do
devise_for :users


get 'questions/commercial'

  get 'questions/ip'

  get 'questions/show_all'

  get 'questions/employment'

  get 'questions/real_estate'

  get 'questions/venture_cap'

  match 'questions/commercial' => 'questions#commercial', via: [:get]

  match 'questions/ip' => 'questions#ip', via: [:get]
  match 'questions/employment' => 'questions#employment', via: [:get]
  match 'questions/real_estate' => 'questions#real_estate', via: [:get]
  match 'questions/venture_cap' => 'questions#venturecap', via: [:get]

  match 'search' => 'questions#search', via: [:get, :post], as: :search

resources :answers do
    resources :answercomments
  end

  resources :questions do 
    resources :questioncomments
  end

  resources :questions do
    resources :answers do
        member do
      put "like", to: "answers#upvote"
      put "dislike", to: "answers#downvote"
    end
  end
end

  root 'questions#show_all'

  
  
end
