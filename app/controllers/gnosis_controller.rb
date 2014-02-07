class GnosisController < ApplicationController

	def index

    # check to see if user was redirected from Feedly
    # if not, render 'index' immediately
    # if so, run below code (set @user) then create new session

    unless request.env['omniauth.auth'].nil?
      code = params['code']
      user = User.find_by_uid(request.env['omniauth.auth']['uid'])
        if user.nil?
          user = User.create_new(request.env['omniauth.auth'], code)
        else
          user = User.update_token(request.env['omniauth.auth'])
        end
      redirect_to create_session_path(user['uid'])
    end
    
    @user = current_user
    @topics = ['Tech','Design', 'News', 'Photography','Do It Yourself', 'Cooking']

  end

  def feed
    feed = params[:feed]
    @streams = fetch_stream(feed)['items']
    binding.pry
  end

  def history
    uid = params[:uid]
    @user = User.find_by_uid(uid)
    # @links = Link.where(user_id: @user.id)
  end

end

# get some functionality working, send the dev screenshots
# and ask for a development api key



=begin
	
# Structure of requests:

client = OAuth2::Client.new(sandbox, CM786L1D4P3M9VYUPOB8, :site => localhost:8080, :parse_json => true)
token = OAuth2::AccessToken.new(client, your_token) # <-- auth_token assigned to user after redirect from Feedly

# now we can get the informatin we need.  For example:
#	token.get("/categories")
#	token.get("/v3/profile")
	
=end






=begin 


After successfully redirecting to 'localhost:8080' from Feedly:

[2] pry(#<GnosisController>)> request
=> #<ActionDispatch::Request:0x007fb36c37d3f0
 @env=
  {"GATEWAY_INTERFACE"=>"CGI/1.1",
   "PATH_INFO"=>"/",
   "QUERY_STRING"=>
    "code=AQAAmBJ7ImkiOiJhNGI0ZmZmMS1iN2YzLTQwNjctODZkNS1lN2NjM2NiNDI3YWMiLCJ1IjoiMTA2NDgyODc2MjMwMjAyMzk4MD
   "REMOTE_ADDR"=>"127.0.0.1",
   "REMOTE_HOST"=>"127.0.0.1",
   "REQUEST_METHOD"=>"GET",
   "REQUEST_URI"=>
    "http://localhost:8080/?code=AQAAmBJ7ImkiOiJhNGI0ZmZmMS1iN2YzLTQwNjctODZkNS1lN2NjM2NiNDI3YWMiLCJ1IjoiMTA
   "SCRIPT_NAME"=>"",
   "SERVER_NAME"=>"localhost",
   "SERVER_PORT"=>"8080",
   "SERVER_PROTOCOL"=>"HTTP/1.1",
   "SERVER_SOFTWARE"=>"WEBrick/1.3.1 (Ruby/2.0.0/2013-11-22)",
   "HTTP_HOST"=>"localhost:8080",
   "HTTP_CONNECTION"=>"keep-alive",
   "HTTP_ACCEPT"=>
    "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
   "HTTP_USER_AGENT"=>
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.102 Safari/537.
   "HTTP_X_CHROME_VARIATIONS"=>"CNC1yQEIhbbJAQijtskBCKm2yQE=",
   "HTTP_REFERER"=>
    "http://sandbox.feedly.com/v3/auth/auth?client_id=sandbox&redirect_uri=http%3A%2F%2Flocalhost%3A8080&res
   "HTTP_ACCEPT_ENCODING"=>"gzip,deflate,sdch",
   "HTTP_ACCEPT_LANGUAGE"=>"en-US,en;q=0.8",
   "HTTP_COOKIE"=>
    "_shoeapp_session=cWlTQXU5Ym94STNJRDB3NUY3TjcrZHBIVzh0TTl3Y25vWFdYTVIrMmNDUFlOMHZYa3BYS3U1KzUxL3dGWlg4VW
   "rack.version"=>[1, 2],
   "rack.input"=>#<StringIO:0x007fb36c23cdd8>,
   "rack.errors"=>#<IO:<STDERR>>,
   "rack.multithread"=>false,
   "rack.multiprocess"=>false,
   "rack.run_once"=>false,
   "rack.url_scheme"=>"http",
   "HTTP_VERSION"=>"HTTP/1.1",
   "REQUEST_PATH"=>"/",
   "ORIGINAL_FULLPATH"=>
    "/?code=AQAAmBJ7ImkiOiJhNGI0ZmZmMS1iN2YzLTQwNjctODZkNS1lN2NjM2NiNDI3YWMiLCJ1IjoiMTA2NDgyODc2MjMwMjAyMzk4
   "ORIGINAL_SCRIPT_NAME"=>"",
   "action_dispatch.routes"=>
    #<ActionDispatch::Routing::RouteSet:0x000000032803e0>,
   "action_dispatch.parameter_filter"=>[:password],
   "action_dispatch.redirect_filter"=>[],
   "action_dispatch.secret_token"=>nil,
   "action_dispatch.secret_key_base"=>
    "90fe57e5807c38af07e02df4768efbaf41b3da742ce4849b26c3b50507bd3cbc5c42338b9ec7916498397bdda23976ed8c34e52
   "action_dispatch.show_exceptions"=>true,
   "action_dispatch.show_detailed_exceptions"=>true,
   "action_dispatch.logger"=>
    #<ActiveSupport::Logger:0x00000004a88ed8
     @default_formatter=
[3] pry(#<GnosisController>)> request.env["omniauth.auth"]
=> {"provider"=>"feedly",
 "uid"=>"a4b4fff1-b7f3-4067-86d5-e7cc3cb427ac",
 "info"=>{"email"=>"stevedbauer@gmail.com"},
 "credentials"=>
  {"token"=>
    "AQAApQ57ImkiOiJhNGI0ZmZmMS1iN2YzLTQwNjctODZkNS1lN2NjM2NiNDI3YWMiLCJwIjo2LCJhIjoiRmVlZGx5IHNhbmRib3ggY2xpZW50IiwidCI6MSwidiI6InNhbmRib3giLCJ4Ijoic3RhbmRhcmQiLCJlIjoxMzkyMDgyMjYxNDE5fQ:sandbox",
   "refresh_token"=>
    "AQAAR5F7Im4iOiJlVmI5ZzkyZkQ1YUhIdXA2IiwiaSI6ImE0YjRmZmYxLWI3ZjMtNDA2Ny04NmQ1LWU3Y2MzY2I0MjdhYyIsInUiOiIxMDY0ODI4NzYyMzAyMDIzOTgwNzYiLCJwIjo2LCJjIjoxMzkxNDc3NDYxNDE1LCJhIjoiRmVlZGx5IHNhbmRib3ggY2xpZW50IiwidiI6InNhbmRib3gifQ:sandbox",
   "expires_at"=>1392082260,
   "expires"=>true},
 "extra"=>
  {"raw_info"=>
    {"id"=>"a4b4fff1-b7f3-4067-86d5-e7cc3cb427ac",
     "client"=>"Feedly sandbox client",
     "wave"=>"2014.6",
     "familyName"=>"Bauer",
     "givenName"=>"Stephen",
     "google"=>"106482876230202398076",
     "email"=>"stevedbauer@gmail.com",
     "gender"=>"male",
     "picture"=>
      "https://lh3.googleusercontent.com/-eL9--zAl8do/AAAAAAAAAAI/AAAAAAAAABI/8mKSfcRI1Jo/photo.jpg?sz=50",
     "created"=>1391400367589,
     "windowsLiveConnected"=>false,
     "facebookConnected"=>false,
     "evernoteConnected"=>false,
     "pocketConnected"=>false,
     "twitterConnected"=>false,
     "wordPressConnected"=>false,
     "fullName"=>"Stephen Bauer"}},
 "client_id"=>"sandbox",
 "redirect_uri"=>"http://localhost:8080",
 "response_type"=>"code",
 "grant_type"=>"authorization_code"}


=end