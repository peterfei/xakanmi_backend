Rails.application.routes.draw do
  namespace :admin do
    resources :students do 
      
    end
  end

  namespace :admin do
    resources :courses do 
      member do 
        get 'choosecourse'
      end
    end
  end

  namespace :admin do
    resources :categories
  end

  namespace :admin do
    resources :user_roles
  end

  namespace :admin do
    resources :permissions
  end

  namespace :admin do
    resources :roles do 
      member do
        get 'grant'
        patch 'grant_save'
      end
    end
  end

  namespace :admin do
    resources :users do
      member do
        get 'grant' 
        post 'grant'
      end 
    end
    resources :dashboards
    resources :sessions, only: [:new, :create, :destroy]
    # root to: 'admin#dashboards'
  end
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'admin/sessions#new',         via: 'get'
  match '/signout', to: 'admin/sessions#destroy',     via: 'delete'
  #get 'users/new'
  resources :users  
  root to: 'home#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
