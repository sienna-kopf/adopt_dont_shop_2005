Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'

  post '/shelters', to: 'shelters#create'

  patch '/shelters/:id', to: 'shelters#update'

  delete '/shelters/:id', to: 'shelters#delete'

  get '/pets', to: 'pets#index'

  get '/shelters/:shelter_id/pets', to: 'pets#shelter_index'

  get '/pets/:pet_id', to: 'pets#show'

  get '/shelters/:shelter_id/pets/new', to: 'pets#new'

  post '/shelters/:shelter_id/pets', to: 'pets#create'

  get '/pets/:pet_id/edit', to: 'pets#edit'

  patch '/pets/:pet_id', to: 'pets#update'
end
