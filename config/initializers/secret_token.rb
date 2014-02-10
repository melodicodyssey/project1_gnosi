# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Gnosi::Application.config.secret_key_base =  ENV['SECRET_KEY_BASE'] || "fee4e79b8e4635421b962d3d2f967cd589636c49d5ae793db78a5e312cae89bfcd472a4d1baacd2706c86121574696948fde109a97255e220abf6c7c1f06b00a"
												# define SECRET_KEY_BASE in new .env file
												# 	gnosi/.env
												# 		SECRET_KEY_BASE = < paste "$rake secret" output >
												# 	gnosi.gitignore
												# 		.env