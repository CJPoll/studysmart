Rails.application.routes.draw do
  get 'tutors/index'

  get 'courses/index'

  get 'courses/show'

  devise_for :users
  root to: "static#landing"

  get '/profiles/:user_id', to: 'profiles#show'

  get '/universities', to: 'universities#index'
  get '/universities/:university_id/courses', to: 'courses#index', as: :courses

  get '/courses/:course_id/tutors', to: 'tutors#index', as: :tutors
  post '/courses/:course_id/tutors', to: 'tutors#create'
  delete '/courses/:course_id/tutors/', to: 'tutors#destroy'


  post '/universities/:university_id/users', to: 'universities#add_user', as: :join_university
  delete '/universities/:university_id/users', to: 'universities#remove_user', as: :leave_university

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
