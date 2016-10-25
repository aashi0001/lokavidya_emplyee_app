Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: [:index,:show, :create, :update, :destroy]do
        collection do
            get 'viewAll'
          end
        end
      resources :videos, only: [:index]do
        collection do
            get 'limit'
            get 'search'
          end
        end
      end
  end  
  resources :statuses
  resources :videos
  resources :subcategories
  resources :categories
  resources :roles

  get 'user/view'
  get 'user/edit'
  get 'user/update'
  get 'user/role'
  get 'home/show'

  get 'home/index'
  get 'home/okay'
  get 'home/new'

  root 'home#index'

  devise_for :users, controllers: { registrations: "registrations" }
   get':controller(/:action(/:id(.:format)))'=>'foo#matchers'
    post':controller(/:action(/:id(.:format)))'=>'foo#matchers'
end

