Rails.application.routes.draw do
  scope defaults: { format: :json } do
    resources :artists, except: [:new, :edit] do
      resources :albums, only: [:index, :create]
    end
    resources :albums, except: [:new, :edit, :create] do
      resources :songs, only: [:index, :create]
    end
    resources :songs, except: [:new, :edit, :create]
    root to: 'artists#index'
  end
end
