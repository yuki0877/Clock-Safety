Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tests
      resources :health_scores
      resource :users, only: %i[create update] do
        collection do
          post 'update_mails' # メールアドレス登録のエンドポイントを追加
        end
      end
      resource :authenticates, only: %i[show]
      resources :anomalies, only: %i[create index]
      resources :demo_anomalies, only: %i[index]
      resources :demo_healths, only: %i[index]
    end
  end
end
