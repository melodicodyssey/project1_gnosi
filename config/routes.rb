Gnosi::Application.routes.draw do

	# resources :users, :sessions, :gnosis

	root to: 'gnosis#index', as: :index
	
	get '/start', to: 'gnosis#index', as: :start


	get '/auth/feedly/callback', to: 'sessions#create'
	get '/auth/failure', to: 'gnosis#auth_failure'

	get '/sessions/:uid', to: 'sessions#create', as: :create_session
	# post '/sessions/', to: 'sessions#create', as: :create_session

	get '/signout', to: 'sessions#destroy', as: :signout	
	get '/gnosi/feeds/:feed', to: 'gnosis#feed', :constraints => { feed: /[0-9A-Za-z\-\.\%]+/ }

	get '/gnosi/history/:uid', to: 'gnosis#history', as: :history
	
end