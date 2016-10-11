Rails.application.routes.draw do

  get 'users' => 'user#index'
  get 'users/:name/create' => 'user#create'

  get 'users/:name/gists' => 'gist#index_by_user'
  post 'gists/:g_id/bookmark' => 'gist#bookmark'

  get 'bookmark/:tag/filter' => 'gist#filter'

  get 'bookmarks' => 'gist#index'
end
