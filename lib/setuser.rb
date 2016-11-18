# coding: utf-8
class Setuser
  attr_accessor :user

  #read from config file
  def initialize(value)
    self.user = value
  end

  #update value
  def update
    config =  YAML::load (File.open("../config/loginx.yml"))
    config['config']['user'] = self.user
    File.open("../config/loginx.yml","w") do |file|
      file.write config.to_yaml
    end
  end

end