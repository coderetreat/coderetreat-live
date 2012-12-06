CoderetreatLive::Application.routes.draw do
  resources :coderetreats, only: [] do
    get :running_today, :on => :collection
  end

  resources :coderetreats, module: "admin", only: [] do
    get :manage_status, :on => :member
    put :update_status, :on => :member
    resources :sessions, only: [:create], controller: "coderetreat_sessions"
  end

  root to: "coderetreats#running_today"
end
