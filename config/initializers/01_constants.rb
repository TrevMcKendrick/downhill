if Rails.env.development? or Rails.env.test?
  STRIPE_API_KEY = "sk_test_5kEoB0WcQmNFWgnUVnYX6uAc"
  STRIPE_PUBLIC_KEY = "pk_test_tl3bInCaozqKo5yJCciHlA2F"
  STRIPE_CLIENT_ID = "ca_3Z5r7GyNyisAgSS23x7STf4gaVYlIQ8Z"
  DOMAIN_NAME = "localhost:3000"
elsif Rails.env.production?
  STRIPE_API_KEY = "sk_live_EpiTQiYsFlvKQA3T1rs3EiHg"
  STRIPE_PUBLIC_KEY = "pk_live_Oc672B1KrZ4OWytLidJ1ro94"
  STRIPE_CLIENT_ID = "ca_3Z5rPvHhlZx5VcTBQwIWt1lJahZ69iGH"
  DOMAIN_NAME = ""
end