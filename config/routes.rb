Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :homes do
    member do
      get 'show_user'
      get 'approve_balance_super_admin'

    end
    collection do
      get 'edit_requests'
      get 'add_new_user'
      post 'create_new_user'
      get 'list_all_users'
      get 'add_balance'
      post 'submit_add_balance'
      get 'super_admin_dashboard'
      get 'user_report'
      get 'daily_report'
      get 'ceo_daily_report'
      get 'ceo_monthly_report'
      get 'accountant_report'
      get 'f_expenditure_report'
      get 'h_expenditure_report'
      get 'e_expenditure_report'
      get 't_expenditure_report'
    end
  end
  
  resources :hotel_expenditures do
    member do
      get 'edit_request'
      get 'approve_edit_request'
    end 
  end
  resources :extra_expenditures do
    member do
      get 'edit_request'
      get 'approve_edit_request'
    end 
  end
  resources :food_expenditures do
    member do
      get 'edit_request'
      get 'approve_edit_request'
    end 
  end
  resources :transport_expenditures do
    member do
      get 'edit_request'
      get 'approve_edit_request'
    end 
  end
  # You can have the root of your site routed with "root"
  root 'homes#index'

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
