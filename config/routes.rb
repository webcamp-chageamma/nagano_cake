Rails.application.routes.draw do

  devise_for :admins, controllers: {
     sessions: 'admins/sessions'
  }
  
  devise_for :customers, controllers: {
     sessions: 'customers/sessions',
     registrations: 'customers/registrations'
  }
  
  namespace :admin do
    root to: 'orders#index'
    resources :orders, only: [:show, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :commodities, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    resources :destinations, only: [:index, :create, :edit, :update, :destroy]
    resources :customers, only: [:show, :edit, :update]
    get 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    patch 'customers/hide' => 'customers#hide', as: 'hide'
    resources :orders, only: [:new, :create, :index,:show]
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items' => 'cart_items#destroy_all'
    resources :commodities, only: [:index, :show]
  end

end
