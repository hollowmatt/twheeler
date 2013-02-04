class StravaService
	require 'faraday'
	
	def get_user(user_name, password)
		raw_response = Faraday.post do |req|
			req.url 'https://www.strava.com/api/v2/authentication/login'
			req.headers['Content-Type'] = 'application/json'
			req.params = user_params_for(user_name, password)
		end
		response = user_from_response(raw_response)
	end

	private
		def user_params_for(user_name, password)
			{
				email: user_name,
				password: password
			}
		end

		def user_from_response(raw_response) #put this in a datamapper class soon
			#TODO: put a check here to see if status = 200 or not.
			data = JSON.parse raw_response.env[:body]
			token = data['token']
			user_id = data['athlete']['id']
			name = data['athlete']['name']
			{token: token, user_id: user_id, name: name}
		end
end
