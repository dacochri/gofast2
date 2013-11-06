Gofast2::Application.routes.draw do
  
  # This file defines the which urls the application should expect to accept, and defines variables to access that url

  devise_for :users

  resources :users
  
  get 'quotes' => 'quotes#new', :as => :quotes

  get 'job_applications' => 'job_applications#new', :as => :job_applications
  
  get "schedule/index"

  #get "quotes/index"
  
  #routes for quote
  resources :quotes, :only => [:new, :create] do
  get 'thank_you', :on => :collection
  end
  
  resources :job_applications, :only => [:new, :create] do
  get 'thank_you', :on => :collection
  end
  get "index/index"

  get 'about' => 'index#about', :as => :about

  get 'contact' => 'index#contact', :as => :contact

  resources :drivers

  resources :trailers

  resources :trucks

  resources :job_postings, shallow: true do
    resources :job_applications, :only => [:new, :create] do
    get 'thank_you', :on => :collection
    end
  end
  
  resources :maintenances

  resources :trips

  resources :shipments

  resources :skids

  resources :announcements

  resources :cartages

  resources :companies

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'index#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
