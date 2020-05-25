Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [ :destroy ]
end

# Routes - we have the root to - for the index. But now that we go online with a new database, do I need to include
#   resources :cocktails, except: :index
