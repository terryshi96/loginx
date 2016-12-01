# coding: utf-8
class Core_p
  attr_accessor :project , :server_alias
  $public_key_path = File.expand_path("~/.ssh/id_rsa.pub")
  $config_path = File.expand_path("~/.loginx/config/config.yml")
  $project_path = File.expand_path("~/.loginx/projects/")

  def initialize(project,server_alias)
    self.project = project
    self.server_alias = server_alias
    if !File.exist?("#{$public_key_path}")
      puts "you dont have a pair of ssh key,we will generate it"
      self.generate_key
    end
  end

  #when trying to send public key
  def generate_key
      puts "please enter return 3 times"
      cmd = "ssh-keygen -t rsa"
      `#{cmd}`
  end

  def login
    if Loginx::Exist.project_exist?(self.project)
      config =  YAML::load (File.open("#{$config_path}"))
      info = YAML::load(File.open("#{$project_path}/#{self.project}.yml"))
      if !info.has_key?(self.server_alias)
        puts "sorry the server alias does not exist"
        exit 1
      end
    user = config['config']['user']
    port = config['config']['port']
    ip = info[self.server_alias]['ip']
    password = info[self.server_alias]['password']
    cmd = "ssh -p #{port} #{user}@#{ip}"
    exp = RubyExpect::Expect.spawn("#{cmd}")
    exp.procedure do
      any do
        expect /Permission denied/ do
          puts "this user is not allowed"
        end

        expect /Connection refused/ do
          puts "please check your port setting or password"
        end

        expect /continue connecting/ do
          send "yes"
        end

        expect /\$\s+$/ do
          puts "login successfully and press return to continue"
          interact
        end

        expect /\#\s+$/ do
          puts "login successfully and press return to continue"
          interact
        end

        expect /assword/ do
          cmd = "ssh-copy-id -i #{user}@#{ip}"
          exp2 = RubyExpect::Expect.spawn("#{cmd}")
          exp2.procedure do
            any do
              expect /Permission denied/ do
                puts "this user is not allowed"
              end

              expect /continue connecting/ do
                send "yes"
              end

              expect /assword/ do
                send "#{password}"
                sleep 3
                puts "now you can try again, or use |ssh #{user}@#{ip}| if failed please check your password"
                exit 0
              end

              run
            end
          end
        end

        run
      end
    end
    else
      puts "project does not exist"
      exit 1
    end
  end


end