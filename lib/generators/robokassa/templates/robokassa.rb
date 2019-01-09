Robokassa.configure do |config|
  config.login = ENV['MERCHANT_LOGIN']
  config.first_password = ENV['FIRST_PASSWORD']
  config.second_password = ENV['SECOND_PASSWORD']
  config.mode = :test # или :production
end