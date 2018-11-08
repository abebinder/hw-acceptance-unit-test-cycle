Rottenpotatoes::Application.routes.draw do
  root :to => redirect('/movies')
  resources :movies do
    get 'similar_movies'
  end
end