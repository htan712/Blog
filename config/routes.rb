Rails.application.routes.draw do
    root 'welcome#index'
    get 'welcome/index'
    get 'contact/index'
    resources :posts
end
