class ApplicationController < ActionController::Base

  include Mobylette::RespondToMobileRequests

  before_filter :staging_redirect

  private

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def staging_redirect
    if Rails.env == "staging"
      feature = Feature.find_by_name("staging_on") 
      if feature
        redirect_to "http://www.hautaulogy.com" and return if !feature.active
      end
    end
  end

end
