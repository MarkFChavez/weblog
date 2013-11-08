class OmniauthCallbacksController < ApplicationController
	def all
		auth = request.env["omniauth.auth"]
		user = User.from_omniauth(auth)

		if user.persisted?
			flash[:notice] = "Signed in successfully"
			sign_in_and_redirect user
		else
			session["devise.user_attributes"] = user.attributes
			redirect_to new_user_registration_url
		end
	end

	#hash.provider
	#hash.uid
	#hash.info.email
	#hash.info.image

	alias_method :facebook, :all
end
