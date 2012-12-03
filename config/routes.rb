CoderetreatLive::Application.routes.draw do
  resources :coderetreats, only: [] do
    get :todays_running, :on => :collection
  end

  resources :coderetreats, module: "admin", only: [] do
    get :manage, :on => :member
  end
end
