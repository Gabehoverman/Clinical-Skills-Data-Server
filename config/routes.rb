Rails.application.routes.draw do

  root 'landing#index'

  get 'landing/index'

  resources :systems do
    collection do
      get 'all'
    end
  end
  resources :components, :only => [:index, :create, :update, :destroy]
  resources :exam_techniques, :only => [:index, :create, :update, :destroy]
  resources :palpations, :only => [:index, :create, :update, :destroy]
  resources :ranges_of_motion, :only => [:index, :create, :update, :destroy]
  resources :muscles, :only => [:index, :create, :update, :destroy]
  resources :special_tests, :only => [:index, :create, :update, :destroy]
  resources :image_links, :only => [:index, :create, :update, :destroy]
  resources :video_links, :only => [:index, :create, :update, :destroy]

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
