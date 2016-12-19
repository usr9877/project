Rails.application.config.assets.version = '1.0'


["admins","companies","his","usage","home","login","types","users","books","sign_in"].each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
end