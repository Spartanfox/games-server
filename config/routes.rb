Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "home#index"
  resources :games do
    resources :levels do
      resources :highscores
    end
  end
  resources :levels do
    resources :highscores 
  end
  
  get ":id", to: "games#show"
  get ":game_id/:level_id", to: "levels#show"
  get ":game_id/levels/new", to: "levels#new"

  get ":game_id/:level_id/new", to: "highscores#new"
  get ":game_id/:level_id/Highscores", to: "highscores#index"
end
