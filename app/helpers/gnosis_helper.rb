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

	# get Stream Ids from a single Feed Id
	def get_stream_ids(feed_id)
		enc = CGI::escape(feed_id)
		streamIDs = JSON.parse(
			Typhoeus.get(
				"http://sandbox.feedly.com/v3/streams/#{enc}/ids", 
				headers: {Authorization: current_user['access_token']}
			).body
		)['ids']
		return streamIDs
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
