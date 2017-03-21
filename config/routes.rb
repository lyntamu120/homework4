Rottenpotatoes::Application.routes.draw do

  get "movies/show_same_director"


  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')


end
