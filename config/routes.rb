Rails.application.routes.draw do

  namespace :pc do
    get 'index' => 'home#index'
    resources :users
  end

  namespace :mobile do
    get 'index' => 'home#index'
    get 'thank_you' => 'home#thank_you'
    get 'unique_error' => 'home#unique_error'
    resources :users
  end

  get 'web_switch' => 'web_switch#index'
  get 'fb_switch' => 'fb_switch#index'

  root 'web_switch#index'
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  get "/:code", to:"coupons#show", contraints:{code: /[a-z]{5}-\d{4}/}, as: "coupon"
  get "/:code/edit", to:"coupons#edit", contraints:{code: /[a-z]{5}-\d{4}/}, as: "edit_coupon"
  put "/:code", to:"coupons#update", contraints:{code: /[a-z]{5}-\d{4}/}, as: "update_coupon"
  resources :users
  resources :coupons, except: [:update, :edit, :show] do
  end
    
    
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
