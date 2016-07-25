Rails.application.routes.draw do
  resources :events
  resources :dogs
  resources :posts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'index' => 'page#home'

  get 'search' => 'page#search'

  # get 'page/about'

  # get 'page/contact'
  
  get 'privacy'=>'page#privacy'
  get 'terms'=>'page#terms'
  
  # ContactUS routes
  # resources :contact_from
  get '/contact_us' => 'contacts#new'
  # get '/contacts'=> 'contacts#index'
  post 'contacts' => 'contacts#create'
  delete 'contacts' => 'contacts#destroy'

  get 'users' => 'users#index'
  
  # as :user do
  #   get 'users/:id', :to => 'devise/registrations#edit', :as => :user_root
  # end
  # get 'owners' => 'users#dogowner'
  
    
  devise_for :users , :controllers => { :registrations => :registrations }
  
  # resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#home'
  resources 'users' do
    resources :reviews, expect: [:index, :show]
    # resources :reviews, only: [:new, :index], expect: [:index]
  end

end
