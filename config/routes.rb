Rails.application.routes.draw do

  get 'pictures/index'

  get 'courses/index'

  root "angular#index"
  get '/about' => 'angular#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
