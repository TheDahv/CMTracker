CMTracker::Application.routes.draw do
  get "reports/" => "reports#index"
  get "reports/index"
  get "reports/attendances"
  get "reports/roster"
  get "reports/roster_printout"
  get "reports/checkins"

  devise_for :volunteers
  devise_scope :volunteer do
    match "volunteers/sign_out" => "devise/sessions#destroy"
  end
  get "volunteers" => "volunteers#index"

  # Rails admin
  #mount RailsAdmin::Engine => 'admin', :as => 'rails_admin'

  match "attendances/import" => "attendances#import"
  resources :attendances
  resources :services
  resources :classrooms
  resources :parents
  resources :children

  root :to => "home#index"
  post "processCheckin" => "home#processCheckin"
  post "undoCheckin" => "home#undoCheckin"
end
