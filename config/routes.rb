Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tickets#index'

  resources :tickets do
    collection do
      get 'manage'
    end
  end

end
