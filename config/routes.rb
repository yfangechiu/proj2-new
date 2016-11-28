Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root to: "home#index"
  get '/users', to: 'users#show', as: 'curr_user'
  get '/newPet', to: 'pets#new', as: 'new_pet'
  post '/createPet', to: 'pets#create', as: 'create_pet'
  get '/searchPets', to: 'pets#show', as: 'search_pets'
  patch '/request', to: 'request#new', as: 'new_request'
  post '/request', to: 'request#delete', as: 'delete_request'
  post '/createRequest', to: 'request#create', as: 'create_request'
  post '/deletePet', to: 'pets#delete', as: 'delete_pet'
  post '/acceptRequest', to: 'request#accept', as: 'accept_request'
  post '/declineRequest', to: 'request#decline', as: 'decline_request'

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
