# coding: utf-8
class Delete
  attr_accessor :server_alias
  @flag = 0

  def initialize(server_alias = nil)
    self.server_alias = server_alias
  end

  def del_record(value)
    Find.find("../projects/") do |filename|
      if File.basename(filename,'.yml') == value
        @flag = 1
        @load = YAML::load(File.open("../projects/#{value}.yml"))
        if !@load.has_key?(self.server_alias)
          puts "sorry the server alias does not exist"
          exit 1
        end
        puts "Are you sure to delete it(y/n)"
        gets
        if $_.chomp =='y'
          @load.delete(self.server_alias)
        end

      end
    end

    if @flag == nil
      puts "project #{value} does not exist!"
      exit 1
    end

    File.open("../projects/#{value}.yml","w") do |file|
      YAML.dump(@load,file)
      file.close
      #file.write @info.to_yaml
      puts "update successfully"
    end
  end



  def del_file(value)
    Find.find("../projects/") do |filename|
      if File.basename(filename,'.yml') == value
        @flag = 1
      end
    end

    if @flag == nil
      puts "project #{value} does not exist!"
      exit 1
    end

    puts "Are you sure to delete it(y/n)"
    gets
    if $_.chomp =='y'

    File.delete("../projects/#{value}.yml")
    puts "update successfully"
    end
  end

end







