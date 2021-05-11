Rails.application.routes.draw do
  get "/bartenders", to: 'bartenders#index'
  get "/bartenders/:id", to: 'bartenders#show'

  get "/drinks", to: 'drinks#index'
  get "/drinks/:id", to: 'drinks#show'

  # parent child
  get "/bartenders/:id/drinks", to: 'bartender_drinks#index'
end
