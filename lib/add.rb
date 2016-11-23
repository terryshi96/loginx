# coding: utf-8
class ADD
  attr_accessor :server_alias, :ip, :password


  def initialize(server_alias,ip,password)
    self.server_alias = server_alias
    self.ip = ip
    self.password = password
  end

  def add_record(value)
    project_path = File.expand_path("~/.loginx/projects/")
    if Loginx::Exist.project_exist?(value)
        @info = {}
        detail = {}
        detail['ip'] = self.ip
        detail['password'] = self.password
        @info.store(self.server_alias,detail)
        @load = YAML::load(File.open("#{project_path}/#{value}.yml"))
        if @load.has_key?(self.server_alias)
          puts "the server alias already exists,will you overwrite it(y/n)"
          gets
          unless $_.chomp =='y'
            puts "nothing changed"
            exit 1
          end
        end
        @load.merge!(@info)

    else
      puts "project #{value} does not exist , will you create it(y/n)"
      gets
      if $_.chomp == 'y'
        file = File.new("#{project_path}/#{value}.yml","w")
        file << "---\n"
        file << "example:\n"
        file << " ip: nil\n"
        file << " password: nil\n"
        file.close
        add_record(value)
      else
        puts "nothing changed"
        exit 1
      end
    end


    File.open("#{project_path}/#{value}.yml","w") do |file|
      YAML.dump(@load,file)
      file.close
      #file.write @info.to_yaml
      puts "update successfully"
    end


  end

end



