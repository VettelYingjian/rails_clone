Rails.configuration.stripe = {
  :publishable_key => 'pk_test_qglYITXHpo49PPtffT2vQEcg',
  :secret_key      => 'sk_test_LTTqOg3xhsQgzJiFL7Ui1VOg'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
