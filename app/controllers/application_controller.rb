class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do 
  	begin
  	rescue CanCan::AccessDenied
  		redirect_to root_url, notice: "Access denied"
  	end
  end
end
