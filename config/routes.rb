Rails.application.routes.draw do
  root 'static_pages#home'
  get 'milestones' => 'static_pages#milestones'
  resources :users do
    resources :statements
  end 
  
  get 'all_users' => 'users#index'
  get 'signup' => 'users#new'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :characters
  get 'character_creator' => 'characters#new'
  put 'action' => 'characters#character_action'

  resources :games do
    resources :statements
  end

  get 'play/:id' => 'games#play'
  get 'game_stuff' => 'static_pages#games'
  get 'choose_character' => 'games#pick_character'
  put 'add_to_game' => 'games#add_character_to_game'
  get 'games/:id/characters' => 'games#game_characters'
  get 'your_games' => 'games#games_you_play' 

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
  #  
end
