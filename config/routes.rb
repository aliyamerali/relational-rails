Rails.application.routes.draw do
  get "/bartenders", to: 'bartenders#index'
  get "/bartenders/:id", to: 'bartenders#show'

  get "/drinks", to: 'drinks#index'
  get "/drinks/:id", to: 'drinks#show'

  get "/libraries", to:'libraries#index'
  get "/libraries/new", to:'libraries#new'
  get "/libraries/:id", to:'libraries#show'
  post "/libraries", to:'libraries#create'
  get "/libraries/:id/edit", to:'libraries#edit'

  get "/books", to:'books#index'
  get "/books/:id", to:'books#show'

  # parent child
  get "/bartenders/:id/drinks", to: 'bartender_drinks#index'

  get "/libraries/:id/books", to: 'library_books#index'
end
