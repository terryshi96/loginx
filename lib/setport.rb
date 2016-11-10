# coding: utf-8
class Setport
  attr_accessor :port

  #read from config file
  def initialize(value)
    self.port = value
  end

  #update value
  def update
    @config =  YAML::load (File.open("../config/loginx.yml"))
    puts @config
    @config['config']['port'] = self.port
    File.open("../config/loginx.yml","w") do |file|
      file.write @config.to_yaml
    end
  end

end