Rails.application.routes.draw do
  get "/bartenders", to: 'bartenders#index'
  get "/bartenders/:id", to: 'bartenders#show'

  get "/drinks", to: 'drinks#index'
  get "/drinks/:id", to: 'drinks#show'

  get "/libraries", to:'libraries#index'
  get "/libraries/:id", to:'libraries#show'

  get "/books", to:'books#index'
  get "/books/:id", to:'books#show'

  # parent child
  get "/bartenders/:id/drinks", to: 'bartender_drinks#index'
end
