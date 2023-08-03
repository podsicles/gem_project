Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  root 'home#index'
    get '/', to: 'admin/home#index', as: :admin_root
    get '/', to: 'client/home#index', as: :client_root
  constraints(ClientDomainConstraint.new) do
  end
  constraints(AdminDomainConstraint.new) do
  end
end
