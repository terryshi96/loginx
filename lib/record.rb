# coding: utf-8
class Record
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
        @projects[value] = []

        @projects[value]['server_alias'] = self.server_alias
        @projects[value]['ip'] = self.ip
        @projects[value]['password'] = self.password
      end
    end

    if @flag == nil
      puts "project #{value} does not exist , will you create it(y)"
      gets
      if $_.chomp == 'y'
        file = File.new("../projects/#{value}.yml","w")
        file << "---\n"
        file.close
        puts "create successfully and now you can add servers"
        exit 1
      else
        puts "nothing changed"
        exit 1
      end
    end

    File.open("../projects/#{value}.yml","a") do |file|
      file.write @projects.to_yaml
    end

  end


  def del_record(value)
    Find.find("../projects/") do |filename|
      if File.basename(filename,'.yml') == value
        @flag = 1
        @projects =  YAML::load (File.open("../projects/#{value}.yml"))
        if @projects == nil

        end
      end
    end
    if @flag == nil
      puts "project #{value} does not exist"
      exit 1
    end


  end




end