# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Proj::Application.config.secret_key_base = secure_token

#Proj::Application.config.secret_key_base = 'a69f453663dba69bd733e75c906485ac188a7f69e5aea456dcd273ff57193367be213d00087e8640fb04faeb4a833f29d6176cb52ee9ef8739408d90a558dbcb'
