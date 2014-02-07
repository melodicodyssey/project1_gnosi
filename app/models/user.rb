class User < ActiveRecord::Base

	before_save :create_remember_token

	#MAKE TOKEN NUMBERS SECRET: DEFINE THEM IN .env FILE AND PLACE THEM HERE

	def self.create_new result, code

		# set new User with parameters pulled from response from Feedly login
		user = User.new(
        uid: result['uid'],
        family_name: result['extra']['raw_info']['familyName'],
        given_name: result['extra']['raw_info']['givenName'],
        email: result['extra']['raw_info']['email'],
        picture: result['extra']['raw_info']['picture'],
        auth_token: result['credentials']['token'],
        refresh_token: result['credentials']['refresh_token']
      )

		# use auth_token to request a refresh_token from Feedly
		# add refresh_token to user
		get_refresh = Typhoeus.post("http://sandbox.feedly.com/v3/auth/token", params: {code: code, client_id: 'sandbox', client_secret: "CM786L1D4P3M9VYUPOB8", redirect_uri: 'http://localhost:8080', state: "/feed/#{user.uid}", grant_type: "authorization_code"})
		parsed_get_refresh = JSON.parse(get_refresh.body)
	 	user.update_attributes(refresh_token: parsed_get_refresh['refresh_token'])

	 	# use refresh_token to request an access_token from Feedly
	 	# add access_token to user
	 	use_refresh = Typhoeus.post("http://sandbox.feedly.com/v3/auth/token", params: {refresh_token: user['refresh_token'], client_id: 'sandbox', client_secret: "CM786L1D4P3M9VYUPOB8", grant_type: "refresh_token"})
		parsed_use_refresh = JSON.parse(use_refresh.body)
		user.update_attributes(access_token: parsed_use_refresh['access_token'])

		# save the user
		user.save
		return user
	end

	def self.update_token result
		user = User.find_by_uid(result['uid'])
		 user.update_attributes(auth_token: result['credentials']['token'])

	 	use_refresh = Typhoeus.post("http://sandbox.feedly.com/v3/auth/token", params: {refresh_token: user['refresh_token'], client_id: 'sandbox', client_secret: "CM786L1D4P3M9VYUPOB8", grant_type: "refresh_token"})
		parsed_use_refresh = JSON.parse(use_refresh.body)
		user.update_attributes(access_token: parsed_use_refresh['access_token'])

		 return user
	end

	def get_request (type)
		request = JSON.parse(Typhoeus.get("https://sandbox.feedly.com/v3/#{type}", headers: {Authorization: self.auth_token}).body)
	end


	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end

end

# 1d39dcfc-10d7-4ad8-a12f-29e1c22a1eef		checks
# 1d39dcfc-10d7-4ad8-a12f-29e1c22a1eef		out