# coding: utf-8
class Setuser
  attr_accessor :user

  #read from config file
  def initialize(value)
    self.user = value
  end

  #update value
  def update
    config_path = File.expand_path("~/.loginx/config/config.yml")
    if File.exist?("#{config_path}")
      config = YAML::load (File.open("#{config_path}"))
      config['config']['user'] = self.user
      File.open("#{config_path}", "w") do |file|
        file.write config.to_yaml
        file.close
        puts "update successfully,now default user is #{self.user}"
      end
    else
      puts "initialize successfully please try again"
    end
  end
end