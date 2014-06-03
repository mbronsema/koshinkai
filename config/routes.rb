Rails.application.routes.draw do
  resources :adminpanels do
    resources :posts
    resources :users
    
  end


  devise_for :users, :controllers => {:registrations => "my_devise/registrations"} 
 
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :adminpanels_destroy_user 

             
  resources :users
  resources :posts
  resources :events
  resources :categories
  resources :attachments
  resources :comments


  

  get '/:headurl/:url', to: 'categories#show', as: 'submenu'
  get '/search', to: 'posts#search', as: 'search'
  match '/:adminpanels' => 'adminpanels#index', :via => :get, as: 'admin'
  get '/:headurl/:url/postnew', to: 'categories#postnew', as: 'catpost' 
  match '/:headurl/:url/postcreate' => 'categories#postcreate', :via => :post

  match '/adminpanels/users', to: 'adminpanels#users', via: 'get'
 # match '/:admin/destroypost' => 'admin#destroypost', :via => :delete, as: 'delete'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'posts#home'

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
