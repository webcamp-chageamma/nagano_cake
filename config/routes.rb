Rails.application.routes.draw do

  devise_for :admins, controllers: {
     sessions: 'admin/sessions'
  }

  devise_for :customers, controllers: {
     sessions: 'customers/sessions',
     registrations: 'customers/registrations'
  }

  namespace :admin do
    root to: 'orders#index'
    resources :orders, only: [:show, :update]
    resources :order_commodities, only: [:update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :commodities, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    get 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    get '/search', to: 'searches#search'
    patch 'customers/hide' => 'customers#hide', as: 'hide'
    resources :destinations, only: [:index, :create, :edit, :update, :destroy]
    resources :customers, only: [:show, :edit, :update]
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    resources :orders, only: [:new, :create, :index,:show]
    delete '/cart_items' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]
    resources :commodities, only: [:index, :show]
  end

end
