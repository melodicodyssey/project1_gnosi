# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Gnosi::Application.config.secret_key_base = '90fe57e5807c38af07e02df4768efbaf41b3da742ce4849b26c3b50507bd3cbc5c42338b9ec7916498397bdda23976ed8c34e52b4779c64cc4bb7b99ed4cf7ee'
											# ENV['SECRET_KEY_BASE']
												# define SECRET_KEY_BASE in new .env file
												# 	gnosi/.env
												# 		SECRET_KEY_BASE = < paste "$rake secret" output >
												# 	gnosi.gitignore
												# 		.env