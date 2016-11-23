# coding: utf-8
class Core_p
  attr_accessor :project , :server_alias
  $public_key_path = File.expand_path("/temp/.ssh/id_rsa.pub")
  $config_path = File.expand_path("~/.loginx/config/config.yml")
  $project_path = File.expand_path("~/.loginx/projects/")

  def initialize(project,server_alias)
    self.project = project
    self.server_alias = server_alias
  end

  #when trying to send public key
  def generate_key
      puts "please enter return 3 times"
      cmd = "ssh-keygen -t rsa"
      `#{cmd}`
  end


  #when asking for password
  def send_key
    if !File.exist?("#{$public_key_path}")
      puts "you dont have a pair of ssh key,we will generate it"
      self.generate_key
    end
    config =  YAML::load (File.open("#{$config_path}"))
    info = YAML::load(File.open("#{$project_path}/#{self.project}.yml"))
    user = config['config']['user']
    ip = info[self.server_alias]['ip']
    password = info[self.server_alias]['password']
    cmd = "ssh-copy-id -i #{user}@#{ip}"

    #expect 2 conditions
    exp = RubyExpect::Expect.spawn("#{cmd}")
    exp.procedure do
      any do
        expect /Permission denied/ do
          puts "this user is not allowed"
        end

        expect /continue connecting/ do
          send "yes"
        end

        expect /assword/ do
          send "#{password}"
        end
        run
      end
    end


  end

  def login
    config =  YAML::load (File.open("#{$config_path}"))
    info = YAML::load(File.open("#{$project_path}/#{self.project}.yml"))
    user = config['config']['user']
    port = config['config']['port']
    ip = info[self.server_alias]['ip']
    cmd = "ssh -p #{port} #{user}@#{ip}"
    exp = RubyExpect::Expect.spawn("#{cmd}")
    exp.procedure do
      any do
        expect /Permission denied/ do
          puts "this user is not allowed"
        end

        expect /continue connecting/ do
          send "yes"
        end

        expect /assword/ do
          Core_p::send_key
        end

        expect /\$\s+$/ do
          puts "login successfully"
          interact
        end
        run
      end
    end
  end

end