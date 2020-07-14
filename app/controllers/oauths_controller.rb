class OauthsController < ApplicationController
	def oauth
		args = {
			client_id: ENV['GOOGLE_CLIENT_ID'],
			response_type: 'code'
			scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile'
			redirect_uri: 'http://localhost:3000/oauth/callback?provider=google'
			access_type: 'offline'
		}
		redirect_to 'https://accounts.google.com/o/oauth2/v2/auth?' + args.to_query
	end
end
