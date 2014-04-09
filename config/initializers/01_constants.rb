if Rails.env.development? or Rails.env.test?
  Stripe.api_key = "sk_test_IJphqLl7ZUUxrochhsaJWTJb"
  STRIPE_PUBLIC_KEY = "pk_test_D8QJoVNlDzFFBB3Mx5xC449q"
  STRIPE_CLIENT_ID = "ca_3Z5r7GyNyisAgSS23x7STf4gaVYlIQ8Z"
  ROOT_DOMAIN_NAME = "lvh.me"
  DOMAIN_NAME = "#{ROOT_DOMAIN_NAME}:3000"
  COOKIE_DOMAIN = ".lvh.me"
  TICKET_SCIENCE_FEE = 2.95
elsif Rails.env.production?
  Stripe.api_key = "sk_live_VhYCleaZwuUBGSFYFc7WUboz"
  STRIPE_PUBLIC_KEY = "pk_live_8sCPFZoLtW5pXuVHGrRKrROs"
  STRIPE_CLIENT_ID = "ca_3Z5rPvHhlZx5VcTBQwIWt1lJahZ69iGH"
  ROOT_DOMAIN_NAME = ""
  DOMAIN_NAME = "107.170.227.182"
  TICKET_SCIENCE_FEE = 2.95
  COOKIE_DOMAIN = ".#{DOMAIN_NAME}"
end