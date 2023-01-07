Rails.application.routes.draw do
  Rails.application.routes.draw do
    resources :schools do
      resources :students
    end
  end
  
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'


  
end
