Rails.application.routes.draw do
  
  root to: "pages#home"
  devise_for :users, controllers: { 
    registrations: 'users/registrations', 
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :quotes
  # Defines the root path route ("/")
  resources :quotes do
    resources :line_item_dates, except: [:index, :show] do
      resources :line_items, except: [:index, :show]
    end
  end
end
