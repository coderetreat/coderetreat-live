CoderetreatLive::Application.routes.draw do
  resources :coderetreats, only: [] do
    get :running_today, :on => :collection
  end

  resources :coderetreats, module: "admin", only: [] do
    resource :status, only: [:edit, :update], controller: "coderetreat_status"
    resources :sessions, only: [:create, :edit, :update, :destroy], controller: "coderetreat_sessions"
  end

  get "/maps/:location", to: "map_images#show"

  root to: "coderetreats#running_today"
end
