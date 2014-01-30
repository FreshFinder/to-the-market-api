# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4
# requires secret_key_base or secret_token to be defined, otherwise an
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
ToTheMarket::Application.config.secret_token = 'c07af29414f6dfeb3b2edcda7266b35647f9e49eece5ff83a945413e708e3cd2c72be9944bb2631b8342b620f3ba9a5bd59daa3faad40563cdba2facd12cf9b7'
ToTheMarket::Application.config.secret_key_base = '9f010a156e6cb1c0a2360c7898e90d3f1d38a49a9e3803f7c29482ff6ecd1be219b49729a3534b5a5b8abdb279f423dae9e991285d2720df3d7bc09c2c4b9e71'
