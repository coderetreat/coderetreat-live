CoderetreatLive::Application.routes.draw do
  resources :coderetreats, only: [] do
    get :todays_running, :on => :collection
  end
end
