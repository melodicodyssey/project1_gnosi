#insert omniauth into request flow
#OA will check if request is OA

# OAuth over HTTPS

#ENV = getting from environment

#in user model:

# columns:  uid, auth_token, refresh_token



Rails.application.config.middleware.use OmniAuth::Builder do
  provider :feedly, "sandbox", "CM786L1D4P3M9VYUPOB8",
    scope: "https://cloud.feedly.com/subscriptions",
    callback_path: "",
    client_options: {site: "https://sandbox.feedly.com"}
end


# test = Typhoeus.get("https://sandbox.feedly.com/v3/profile", headers: {Authorization: @steve.auth_token })

# get_refresh = Typhoeus.post("http://sandbox.feedly.com/v3/auth/token", params: {code: @code, client_id: 'sandbox', client_secret: "CM786L1D4P3M9VYUPOB8", redirect_uri: 'http://localhost:8080', state: "/feed/#{@user.uid}", grant_type: "authorization_code"})
# 	parsed_get_refresh = JSON.parse(get_refresh.body)
# 		@user['refresh_token'] = parsed_get_refresh['refresh_token']

# use_refresh = Typhoeus.post("http://sandbox.feedly.com/v3/auth/token", params: {refresh_token: token['refresh_token'], client_id: 'sandbox', client_secret: "CM786L1D4P3M9VYUPOB8", grant_type: "refresh_token"})
# 	parsed_use_refresh = JSON.parse(use_refresh.body)
# 		@user['access_token'] = parsed_use_refresh['access_token']




# Tech feedIDs

# Techcrunch
# 	feed/http://feeds.feedburner.com/Techcrunch



