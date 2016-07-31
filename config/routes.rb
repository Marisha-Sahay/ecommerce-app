  Rails.application.routes.draw do
    get '/', to: 'products#index'
    get '/products', to: 'products#index'
    get '/products/new', to: 'products#new'
    get '/products/:id', to: 'products#show'
    post '/products', to: 'products#create'
    get '/products/:id/edit', to: 'products#edit'
    patch '/products/:id', to: 'products#update'
    delete 'products/:id',to: 'products#destroy'
    post '/products/search', to: 'products#search'

    # suppliers routes
    get '/suppliers', to: 'suppliers#index'
    get '/suppliers/new', to: 'suppliers#new'
    get '/suppliers/:id', to: 'suppliers#show'
    post '/suppliers', to: 'suppliers#create'
    get '/suppliers/:id/edit', to: 'suppliers#edit'
    patch '/suppliers/:id', to: 'suppliers#update'
    delete 'suppliers/:id',to: 'suppliers#destroy'
end
