# coding: utf-8
class ADD
  attr_accessor :server_alias, :ip, :password
  @flag = 0

  def initialize(server_alias,ip,password)
    self.server_alias = server_alias
    self.ip = ip
    self.password = password
  end

  def add_record(value)
    Find.find("../projects/") do |filename|
      if File.basename(filename,'.yml') == value
        @flag = 1
        @info = {}
        detail = {}
        detail['ip'] = self.ip
        detail['password'] = self.password
        @info.store(self.server_alias,detail)
        @load = YAML::load(File.open("../projects/#{value}.yml"))
        if @load.has_key?(self.server_alias)
          puts "the server alias already exists,will you overwrite it(y/n)"
          gets
          unless $_.chomp =='y'
            exit 1
          end
        end
        @load.merge!(@info)
      end
    end

    if @flag == nil
      puts "project #{value} does not exist , will you create it(y)"
      gets
      if $_.chomp == 'y'
        file = File.new("../projects/#{value}.yml","w")
        file << "---\n"
        file << "example:\n"
        file << " ip: nil\n"
        file << " password: nil\n"
        file.close
        puts "create successfully and please enter last command again"
        exit 1
      else
        puts "nothing changed"
        exit 1
      end
    end

    File.open("../projects/#{value}.yml","w") do |file|
      YAML.dump(@load,file)
      file.close
      #file.write @info.to_yaml
      puts "update successfully"
    end

  end

end