if Rails.env.development? or Rails.env.test?
  Stripe.api_key = "sk_test_5kEoB0WcQmNFWgnUVnYX6uAc"
  STRIPE_PUBLIC_KEY = "pk_test_tl3bInCaozqKo5yJCciHlA2F"
  STRIPE_CLIENT_ID = "ca_3Z5r7GyNyisAgSS23x7STf4gaVYlIQ8Z"
  ROOT_DOMAIN_NAME = "lvh.me"
  DOMAIN_NAME = "#{ROOT_DOMAIN_NAME}:3000"
  COOKIE_DOMAIN = ".lvh.me"
  TICKET_SCIENCE_FEE = 295
  TICKET_SCIENCE_FEE_TO_CUSTOMER = (TICKET_SCIENCE_FEE / 0.971 + 0.3).ceil
elsif Rails.env.production?
  Stripe.api_key = "sk_live_EpiTQiYsFlvKQA3T1rs3EiHg"
  STRIPE_PUBLIC_KEY = "pk_live_Oc672B1KrZ4OWytLidJ1ro94"
  STRIPE_CLIENT_ID = "ca_3Z5rPvHhlZx5VcTBQwIWt1lJahZ69iGH"
  ROOT_DOMAIN_NAME = "ticketscience.com"
  DOMAIN_NAME = ROOT_DOMAIN_NAME
  COOKIE_DOMAIN = ".#{DOMAIN_NAME}"
  TICKET_SCIENCE_FEE = 295
  TICKET_SCIENCE_FEE_TO_CUSTOMER = (TICKET_SCIENCE_FEE / 0.971 + 0.3).ceil
end