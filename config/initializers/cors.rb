Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'
    resource '*',
             headers: ['Authorization'],
             expose: ['Authorization'],
             methods: %i[get post put patch delete options head],
             creadentials: true,
             max_age: 86_400
  end
end
