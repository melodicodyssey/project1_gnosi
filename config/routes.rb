Gnosi::Application.routes.draw do

	# resources :users, :sessions, :gnosis

	root to: 'gnosis#index', as: :index
	
	get '/start', to: 'gnosis#index', as: :start


	get '/auth/feedly/callback', to: 'sessions#create'
	get '/auth/failure', to: 'gnosis#auth_failure'

	get '/sessions/:uid', to: 'sessions#create', as: :create_session
	# post '/sessions/', to: 'sessions#create', as: :create_session

	get '/signout', to: 'sessions#destroy', as: :signout	
	get '/gnosi/feed/:uid', to: 'gnosis#feed', as: :feed
	get '/gnosi/history/:uid', to: 'gnosis#history', as: :history
	
end

=begin


#Get list of feed ID's

	def search(topic)
		search = JSON.parse(
			Typhoeus.get(
				"http://sandbox.feedly.com/v3/search/feeds", 
				headers: {Authorization: @user['access_token']}, 
				params: {q: '#'+topic}
			).body
		)['results']  
	end 

		#=> returns Array of Objects (with 'feedId' key)



	#or each Feed ID:

		#To Get Stream ID's and Streams

			search(topic).each do |topic|
				enc = CGI::escape(topic['feedId'])

				streamIDs = JSON.parse(
					Typhoeus.get(
						"http://sandbox.feedly.com/v3/streams/#{enc}/ids", 
						headers: {Authorization: @user['access_token']}
					).body
				)['ids']

					#=> returns array of stream ID's


				streamIDs.each do |id|

					id_enc = CGI::escape(id_enc)

					stream = JSON.parse(
						Typhoeus.get(
							"http://sandbox.feedly.com/v3/streams/#{id_enc}/contents", 
							headers: {Authorization: @user['access_token']}
						).body
					)

					# do something with 'stream'


				end

			end

=end