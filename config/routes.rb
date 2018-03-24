Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :store, only: [:index]
  post 'create_pen' => 'store#create_pen'
  post 'create_notebook' => 'store#create_notebook'
  get 'edit_store_type' => 'store#edit_store_type'
  get 'list' => 'store#list'
  post 'update_store' => 'store#update_store'
end
