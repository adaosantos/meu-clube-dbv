class Auth0Controller < ApplicationController
  skip_before_action :authorize_request

  def callback
    info = request.env["omniauth.auth"]
    session[:user_info] = info["extra"]["raw_info"]
    redirect_to posts_path
  end

  def failure
    @error_msg = request.params["message"]
  end

  def logout
    reset_session
    redirect_to logout_url
  end

  def logout_url
    request_params = { returnTo: post_url, client_id: ENV.fetch("AUTH0_CLIENT_ID", nil) }
    URI::HTTPS.build(
      host: ENV.fetch("AUTH0_DOMAIN", nil), path: "/v2/logout", query: to_query(request_params),
    ).to_s
  end

  def to_query(hash)
    hash.filter_map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.compact.join("&")
  end
end
