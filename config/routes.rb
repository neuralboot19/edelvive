Rails.application.routes.draw do
  namespace :api do
    get '/comunicados/mayores_de_edad', to: 'comunicados#mayores_de_edad'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
