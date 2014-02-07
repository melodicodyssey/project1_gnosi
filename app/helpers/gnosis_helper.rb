module GnosisHelper

	def check_user
		self == current_user
	end

	# get list of Feed Ids from a topic
	# ['feedId']
	# ['title']
	def search_topic(topic)
		search = JSON.parse(
			Typhoeus.get(
				"http://sandbox.feedly.com/v3/search/feeds", 
				headers: {Authorization: current_user['access_token']}, 
				params: {q: '#'+topic}
			).body
		)['results']
		return search
	end 

	# fetch a stream with a Stream Id
	def fetch_stream(stream_id)

		enc = CGI::escape(stream_id)
		stream = JSON.parse(
			Typhoeus.get(
				"http://sandbox.feedly.com/v3/streams/#{enc}/contents", 
				headers: {Authorization: current_user['access_token']}
			).body
		)
		return stream
	end
end
