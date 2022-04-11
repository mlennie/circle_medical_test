Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [] do
        collection do
          get 'get_current_user', to: "users#get_current_user"
        end
      end
    end
  end
end
