Rails.application.routes.draw do
  
  
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

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :genres
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    get '/' => 'homes#top' 
  end
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete :destroy_all
      end
    end
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get :confilm
      end
    end
    patch '/withdrawal' => 'customers#withdrawal'
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post :confilm
        get :complete
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
