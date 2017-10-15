Rails.application.routes.draw do

  get 'pictures/index'

  get 'pictures/index:id' => 'pictures#index'

  root "pictures#index"
  get 'pictures/api' => 'pictures#api', :defaults => { :format => 'json' }, as: :query



  get 'pictures/categories' => 'pictures#categories', :defaults => { :format => 'json' }


  #get 'pictures/api:id' => 'pictures#api'

  #resources :pictures, :defaults => { :format => 'json' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
