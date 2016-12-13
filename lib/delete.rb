# coding: utf-8
class Delete_p
  attr_accessor :server_alias

  def initialize(server_alias = nil)
    self.server_alias = server_alias
  end

  def del_record(value)
    project_path = File.expand_path("~/.loginx/projects/")
    if Loginx::Exist.project_exist?(value)
      @load = YAML::load(File.open("#{project_path}/#{value}.yml"))
      if !@load.has_key?(self.server_alias)
        puts "sorry the server alias does not exist"
        exit 1
      end
      puts "Are you sure to delete it(y/n)"
      gets
      if $_.chomp =='y'
        @load.delete(self.server_alias)
      else
        puts "nothing changed"
        exit 1
      end
    else
      puts "project #{value} does not exist!"
      exit 1
    end


    File.open("#{project_path}/#{value}.yml", "w") do |file|
      YAML.dump(@load, file)
      file.close
      #file.write @info.to_yaml
      puts "update successfully"
    end
  end


  def del_file(value)
    project_path = File.expand_path("~/.loginx/projects/")

    if Loginx::Exist.project_exist?(value)

      puts "Are you sure to delete it(y/n)"
      gets
      if $_.chomp =='y'

        File.delete("#{project_path}/#{value}.yml")
        puts "update successfully"
      else
        puts "nothing changed"
        exit 1
      end
    else
      puts "project #{value} does not exist!"
      exit 1
    end
  end

end
