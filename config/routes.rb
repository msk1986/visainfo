Rails.application.routes.draw do

	# match '/areas/index', to: 'areas#index', via: 'get'
	match '/countries/search/:id', to: 'countries#search', via: 'get'
	# このルートが4行目で指定したルートと大きく関係 　indexは使っていない模様なので削除した
	resources "countries_search", :path => 'countries/search', only: [:show]

	# aboutページ追加　これでいいのか？
	match '/about', to: 'areas#about', via: 'get'

	resources :areas, only: [:index]
	resources :countries, only: [:show]

  # areasのform_tagのリンクをpostに
  post '/areas', to: 'areas#index'

	root 'areas#index'
end
