Rails.application.routes.draw do
     namespace :api do
      namespace :v1 do
        resources :tests
        resources :health_scores
        resource :users, only: %i[create update]
        resource :authenticates, only: %i[show]
        resources :anomalies, only: %i[create index]
      end
    end
end
