OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '384958798225975', '8d7295a7fc6bb951d65d20c8b5715ea2'
end

