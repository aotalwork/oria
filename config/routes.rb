Rails.application.routes.draw do
  get "settings/show"
  get "settings/update"
  namespace :ai do
    resources :task_breakdowns
    resources :procrastinations, only: [:index, :new, :create, :show]
    resources :planners, only: [:index, :create]
    resources :pomodoros, only: [:index, :create]
    resources :text_simplifiers, only: [:index, :create]
    resources :messages, only: [:index, :create]
    resources :study_helpers, only: [:index, :create]
    resources :routines, only: [:index, :create]
    resources :expenses, only: [:index, :create]
    resources :sleep_trackers, only: [:index, :create]
    resources :rewards, only: [:index, :create]
    resources :coaches, only: [:index, :create]
    resources :priorities, only: [:index, :create]
  end
  devise_for :users

  authenticated :user do
    root "dashboard#index", as: :authenticated_root
  end

  unauthenticated do
    root to: redirect("/users/sign_in")
  end

end