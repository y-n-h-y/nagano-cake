Rails.application.routes.draw do
  
  namespace :admin do
    resources :order_details
    resources :orders
    resources :genres
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    get '/' => 'homes#top' 
  end
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :cart_items
    resources :orders
    resources :addresses
  end
  
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  devise_for :admin, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
