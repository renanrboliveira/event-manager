Rails.application.routes.draw do

  root 'site#index'
  
  namespace :api do
    resources :events, only: %i[index cretate update show destroy]
  end
  
  match '*path', to: 'site#index', via: :all

end
