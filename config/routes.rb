Gnosi::Application.routes.draw do

	# resources :users, :sessions, :gnosis
	resources :links

	root to: 'gnosis#index', as: :index	
	get '/start', to: 'gnosis#index', as: :start

	post '/auth/feedly/callback', to: 'sessions#create'
	get '/auth/failure', to: 'gnosis#auth_failure'

	post '/users/:code/:env', to: 'users#create', as: :new_user
	post '/sessions/:env', to: 'users#update', as: :update

	get '/sessions/:uid', to: 'sessions#create', as: :create_session

	get '/signout', to: 'sessions#destroy', as: :signout	
	get '/gnosi/feeds/:title/:feed', to: 'gnosis#feed', as: :feed, :constraints => { feed: /[0-9A-Za-z\-\.\%]+/ }


	get '/gnosi/history/:uid', to: 'gnosis#history', as: :history
	
end