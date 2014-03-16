#insert omniauth into request flow
#OA will check if request is OA

# OAuth over HTTPS

#ENV = getting from environment

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :feedly, 'sandbox', 'W60IW73DYSUIISZX4OUP',
    scope: "https://cloud.feedly.com/subscriptions",
    callback_path: "",
    client_options: {site: "https://sandbox.feedly.com"}
end