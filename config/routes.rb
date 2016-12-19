Rails.application.routes.draw do
  get   '/admin_login', :to => 'login#index'
  get   '/user_login', :to => 'sign_in#index'
  resources :users
  resources :sign_in
  resources :admins

  resources :books

  resources :types

  resources :login
  root 'home#index'
  resources :books do 
    collection do
      post 'create_new_book'
    end
  end

  resources :books do 
    collection do
      post "change_type"
    end
  end


  resources :his do 
    collection do
      get 'history'
      get 'history_book'
      post 'change_type'
      get 'user'
      get 'book'
    end
  end

  resources :types do 
    collection do
      get 'index'
      get 'show'
      post "update"
    end
  end
  resources :usage do 
    collection do
      get 'index'
      get 'book'
    end
  end

  resources :home do 
    collection do
      get 'index'
    end
  end
end