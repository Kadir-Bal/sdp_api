Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # geliştirme için * kullanabiliriz, production’da domain belirt
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
