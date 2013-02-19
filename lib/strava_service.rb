class StravaService
	require 'faraday'
	
	def get_user(user_name, password)
		raw_response = Faraday.post do |req|
			req.url 'https://www.strava.com/api/v2/authentication/login'
			req.headers['Content-Type'] = 'application/json'
			req.params = user_params_for(user_name, password)
		end
		response = Hashie::Mash.new(user_from_response(raw_response))
	end

	def get_rides(user_id)
		raw_response = Faraday.get "http://www.strava.com/api/v1/rides?athleteId=186629"
		response = ride_from_response(raw_response)
		return response
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
			status = raw_response.env[:status]
			if status == 200
				token = data['token']
				user_id = data['athlete']['id']
				name = data['athlete']['name']
				{status: status, token: token, user_id: user_id, name: name}
			else
				{status: status}
			end
		end

		def ride_from_response(raw_response)
			rides = []
			data = JSON.parse(raw_response.env[:body])
			data["rides"].each do |ride|
				rides << Hashie::Mash.new({id: ride["id"], name: ride["name"]})
			end
			rides
		end
end
