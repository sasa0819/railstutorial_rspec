Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'


  require 'devise/orm/active_record'
  config.scoped_views = true

  config.case_insensitive_keys = [:email]


  config.strip_whitespace_keys = [:email]


  config.skip_session_storage = [:http_auth]


  config.stretches = Rails.env.test? ? 1 : 11


  config.reconfirmable = true


  config.expire_all_remember_me_on_sign_out = true


  config.password_length = 4..128


  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/


  config.reset_password_within = 6.hours


  config.sign_out_via = :delete

   config.omniauth :facebook, '369759043617236', '22b2d8997c6eae9976814c7b70b9490f', scope: 'email', info_fields: 'email, username'
end
