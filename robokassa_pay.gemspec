$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'robokassa_pay'
  s.version     = '1.0.0'
  s.date        = '2019-01-08'
  s.summary     = 'Robokassa Pay - Robokassa API wrapper gem'
  s.description = 'Simple gem for Robokassa payments. This gem create work with Robokassa API.'
  s.author      = 'Alexander Levashov'
  s.email       = 'alevash1@gmail.com'
  s.homepage    = 'https://github.com/alexlev1/robokassa_pay'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
end