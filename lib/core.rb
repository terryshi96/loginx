# coding: utf-8
class Core_p
  attr_accessor :project, :server_alias
  $public_key_path = File.expand_path("~/.ssh/id_rsa.pub")
  $config_path = File.expand_path("~/.loginx/config/config.yml")
  $project_path = File.expand_path("~/.loginx/projects/")

  def initialize(project, server_alias)
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
      config = YAML::load (File.open("#{$config_path}"))
      info = YAML::load(File.open("#{$project_path}/#{self.project}.yml"))
      if !info.has_key?(self.server_alias)
        puts "sorry the server alias does not exist"
        exit 1
      end
      user = config['config']['user']
      port = config['config']['port']
      ip = info[self.server_alias]['ip']
      password = info[self.server_alias]['password']

      puts "do you want to send your ssh key"
      puts "enter return to skip or 'y' to continue to send your key"
      flag = STDIN.gets.chomp
      if flag == 'y'
        cmd2 = "ssh-copy-id -i #{user}@#{ip}"
        #exec "#{cmd2}"
        exp = RubyExpect::Expect.spawn("#{cmd2}")
        exp.procedure do
          any do
            expect /Permission denied/ do
              puts "this user is not allowed"
              exit 0
            end

            expect /continue connecting/ do
              send "yes\r"
            end

            expect /Connection refused/ do
              puts "please check your port setting or password"
              exit 0
            end

            expect /already exist/ do
              puts "you already added keys before"
              exit 0
            end

            expect /assword/ do
              send "#{password}\r"
              sleep 3
              puts "now you can try again, or use |ssh #{user}@#{ip}| if failed please check your password"
              exit 0
            end

            run
          end
        end
      end

      cmd = "ssh -p #{port} #{user}@#{ip}"
      exec "#{cmd}"
    else
      puts "project does not exist"
      exit 1
    end
  end
end