Rails.application.routes.draw do
  mount RobokassaApi::Engine => "/robokassa_api"
end
