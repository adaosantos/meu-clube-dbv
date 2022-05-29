Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV.fetch("AUTH0_CLIENT_ID", nil),
    ENV.fetch("AUTH0_CLIENT_SECRET", nil),
    ENV.fetch("AUTH0_DOMAIN", nil),
    callback_path: "/auth/auth0/callback",
    authorize_params: { scope: "openid profile" },
  )
end
