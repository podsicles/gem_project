Rails.application.routes.draw do

  constraints(ClientDomainConstraint.new) do
    devise_for :users, controllers: {
      sessions: 'client/sessions',
      registrations: 'client/registrations'
    }
    scope module: :client, path: '' do
      root 'home#index'
      get 'users/invite', to: 'users#invite', format: :svg
      resources :profiles, only: [:show, :edit, :update]
      resources :addresses, except: :show
    end
  end

  constraints(AdminDomainConstraint.new) do
    namespace :admin, path: '' do
      root 'home#index'
      devise_for :users, controllers: {
        sessions: 'admin/sessions',
      }, as: :admin
    end
  end
end
