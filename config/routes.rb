Rails.application.routes.draw do
  root to: 'home#index'
  resources :tasks, only: %i[index create] do
    member do
      patch 'complete'
    end
  end
end
