Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tickets do
    collection do
      get 'manage'
    end
  end

  root 'tickets#index'
end
