Rails.application.routes.draw do
  devise_for :users
  # root is the channels show
  root to: 'channels#show'

  resources :channels, only: [ :show ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # we need this route within the api so that we can FETCH from the API and POST to the API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :channels, only: [ ] do
        resources :messages, only: [:index, :create]
      end
    end
  end

  # specifying the controller / resources

end
