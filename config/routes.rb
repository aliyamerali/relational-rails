Rails.application.routes.draw do
  get "/bartenders", to: 'bartenders#index'
end
