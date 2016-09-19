Rails.application.routes.draw do
	devise_for :users
    root 'welcome#index'
    resources :posts
    resources :projects
    resources :contacts, only: [:new, :create]
    get '*path' => redirect('/')
end
