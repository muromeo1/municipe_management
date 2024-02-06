Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :municipes, only: %i[new index create update]

  root 'municipes#index'
end
